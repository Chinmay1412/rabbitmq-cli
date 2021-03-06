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
## Copyright (c) 2007-2019 Pivotal Software, Inc.  All rights reserved.

# Formats returned values e.g. to human-readable text or JSON.
defmodule RabbitMQ.CLI.FormatterBehaviour do
  @callback format_output(any, map()) :: String.t | [String.t]
  @callback format_stream(Enumerable.t, map()) :: Enumerable.t

  @optional_callbacks switches: 0,
                      aliases: 0

  @callback switches() :: Keyword.t
  @callback aliases() :: Keyword.t
end
