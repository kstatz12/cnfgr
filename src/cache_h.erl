-module(cache_h).

-export([init/2]).
-export([allowed_methods/2]).
-export([content_types_provided/2, content_types_accepted/2]).
-export([handle/2]).

init(Req, Opts) ->
    {cowboy_rest, Req, Opts}.

allowed_methods(Req, State) ->
    Methods = [<<"GET">>, <<"POST">>, <<"DELETE">>],
    {Methods, Req, State}.

content_types_provided(Req, State) ->
    {[{<<"application/json">>, handle}], Req, State}.

content_types_accepted(Req, State) ->
    {[{<<"application/json">>, handle}], Req, State}.

handle(Req, State) ->
    #{method := Method} = Req,
    case Method of
        <<"GET">> -> get_record(Req, State);
        <<"POST">> -> set_record(Req, State);
        <<"DELETE">> -> delete_record(Req, State);
        _ -> {error, Req, State}
    end.

%% Internal Methods

get_record(Req, State) ->
    io:fwrite("GET Request ~s", [cowboy_req:path(Req)]),
    Body = #{key => 12345678, value => "Hello World"},
    {to_json(Body), Req, State}.
set_record(Req, State) ->
    {ok, Req, State}.
delete_record(Req, State) ->
    {ok, Req, State}.

to_json(Map) when is_map(Map) ->
   jiffy:encode(Map).
