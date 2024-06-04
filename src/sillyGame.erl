-module(sillyGame).

-export([start/0, playerAttack/1, monsterDatabase/1]). % Makes the function public, with 0 parameters

start() ->
    Pid = spawn(sillyGame, monsterDatabase, [#{health => 5}]).
    
monsterDatabase(MonsterStats) ->
    receive
        {Sender, Damage} ->
        NewHealth = maps:get(health, MonsterStats) - Damage,
        
        Sender ! {maps:get(health, MonsterStats), Damage},
        monsterDatabase(#{health => NewHealth})
    end.

playerAttack(Pid) ->
    Pid ! {self(), 2},
    receive 
        {MonsterStats, Damage} ->
            io:format("hurting the monster with ~p health by doing ~p damage!~n", [MonsterStats, Damage]);
        _ -> 
            io:format("Unknown Response")
    end.