## The contents of this file are subject to the Mozilla Public License
## Version 1.1 (the "License"); you may not use this file except in
## compliance with the License. You may obtain a copy of the License
## at http://www.mozilla.org/MPL/
##
## Software distributed under the License is distributed on an "AS IS"
## basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
## the License for the specific language governing rights and
## limitations under the License.
##
## The Original Code is RabbitMQ.
##
## The Initial Developer of the Original Code is GoPivotal, Inc.
## Copyright (c) 2007-2016 Pivotal Software, Inc.  All rights reserved.


defmodule ListParametersCommand do

  @behaviour CommandBehaviour
  @flags [:vhost]

  def run([_|_] = args, _) do
    {:too_many_args, args}
  end

  def run([], %{node: node_name, timeout: timeout, vhost: vhost} = opts) do
    info(opts)
    node_name
    |> Helpers.parse_node
    |> :rabbit_misc.rpc_call(
      :rabbit_runtime_parameters,
      :list_formatted,
      [vhost],
      timeout)
  end

  def run([], %{node: _node_name, timeout: _timeout} = opts) do
    run([], Map.merge(opts, %{vhost: "/"}))
  end

  def usage, do: "list_parameters [-p <vhost>]"

  defp info(%{quiet: true}), do: nil
  defp info(%{vhost: vhost}), do: IO.puts "Listing runtime parameters for vhost \"#{vhost}\" ..."

  def flags, do: @flags
end