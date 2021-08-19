-module(handler).

-export([init/0]).
-export([start/1]).
-export([stop/0]).

init() ->
    cowboy_router:compile([{'_',
                            [{"/cache", cache_h, [set]},
                             {"/cache/:key", cache_h, [gey_key]},
                             {"/cache/:key/evict", cache_h, [evict]}]}]).

start(Dispatch) ->
    cowboy:start_clear(http, [{port, 8081}], #{env => #{dispatch => Dispatch}}).

stop() ->
    cowboy:stop_listener(http).
