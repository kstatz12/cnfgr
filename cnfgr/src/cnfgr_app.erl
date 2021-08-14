%%%-------------------------------------------------------------------
%% @doc cnfgr public API
%% @end
%%%-------------------------------------------------------------------

-module(cnfgr_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    cnfgr_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
