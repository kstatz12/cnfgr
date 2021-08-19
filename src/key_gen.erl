-module(key_gen).

-export([create/1]).

create(Map) when is_map(Map) ->
    List = maps:to_list(Map),
    create(List);
create(List) when is_list(List) ->
    Str = str:string_format("~p", [List]),
    <<Int:64/integer, _/binary>> = murmur:murmur3_x64_128(list_to_binary(Str)),
    Int;
create(_) ->
    invalid_input.
