%%%-------------------------------------------------------------------
%% @doc cnfgr public API
%% @end
%%%-------------------------------------------------------------------

-module(cnfgr_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = handler:init(),
    handler:start(Dispatch),
    cnfgr_sup:start_link().

stop(_State) ->
    handler:stop(),
    ok.

%% internal functions
