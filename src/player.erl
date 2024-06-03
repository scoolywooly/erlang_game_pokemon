-module(player).
-export([checkFood/1, decreaseFood/1]).


displayMenu()->
    io:fwrite("[1] Move\n[2] Consult your Catalog\n[3] Return to the Trading Post\n[4] Capture animal\n[5] Fight animal~n"),
    action = io:get_line("Choose an action [X]:").

start()->
    io:fwrite("You are an explorer, looking for rare and endangered species\nto rescue and bring in to captivity. This is so they can\nreproduce and increase their population in a controlled environment.\nYou have 5 food, so make sure to return to the trading post if you don't find anything!"),
    % display menu
    displayMenu().


checkFood(foodInventory)->
    case foodInventory of
        0 -> gameOver();% game over
        1 -> io:fwrite("Food at ~p! You are starving, go back to the Trading Post!~n", [foodInventory]);
        2 -> io:fwrite("Food at ~p! You are getting hungry.~n", [foodInventory]);
        3 -> io:fwrite("Food at ~p...~n", [foodInventory]);
        4 -> io:fwrite("Food at ~p...~n", [foodInventory]);
        5 -> io:fwrite("Food at ~p...~n", [foodInventory]);
        _ -> io:fwrite("Food is at an unknown ammount.~n")
    end.

gameOver() ->
    io:fwrite("Game Over!~n"),
    halt().

decreaseFood(foodInventory)->
    foodInventory - 1.


% A function I have yet to work on:

% localAction(action) ->
    % This determines the textual output if the player chooses something that doesn't rely on the other process.
    % However, its often that the outcome of this output can then lead to the finding of an animal. In which the animal process is needed.
    
    % Call the "Move" function which simply decreases the food and resets the "chance of finding an animal"

    % Call the "Catalog" function which recieves a list of the animals caught and prints it out. Maybe decreases food..?
    
    % Call the "TradingPost" function which restores the food and resets the "chance of findand an animal", and cashes in the catalog of animals for points$.
    % 
    % Other functions such as the catching or fighting an animal function require other processes and then would no loner be local.





    
