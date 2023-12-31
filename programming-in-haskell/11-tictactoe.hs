-- 1. Using the function gametree, verify that there are 549,946 nodes in the complete game tree for a 3ˆ3 tic-tac-toe game starting from the empty grid, and
-- that the maximum depth of this tree is 9.


-- 2. Our tic-tac-toe program always chooses the first move from the list of best moves. Modify the final program to choose a random move from the list of
-- best moves, using the function randomRIO :: (Int,Int) -> IO Int from System.Random to generate a random integer in the given range.

-- 3. Alternatively, modify the final program to choose a move that attempts to take the quickest route to a win, by calculating the depths of resulting game
-- trees and selecting a move that results in a tree with the smallest depth.

-- 4. Modify the final program to:
--
-- a. let the user decide if they wish to play first or second;
-- b. allow the length of a winning line to also be changed;
-- c. generate the game tree once, rather than for each move;
-- d. reduce the size of game tree using alpha-beta pruning.
