# the idea
this project is supposed to be a wave survival game where you can move arounda map, and various enemies come to attack you.

# hour 1

### movement
movement is very simple, just 8 way movement for a top down game.
I've taken the code from the platformer template, stripped out gravity and jumping, and duplicated the remainder for the y axis.

### enemy
the plan is to get the enemy to walk towards the player, though i'm not currently sure how to get the position of the player to the enemy, so for now they walk towards the cursor.

I got it to do this partially by stealing code from the [docs](https://docs.godotengine.org/en/stable/tutorials/2d/2d_movement.html#rotation-movement-mouse), and partially through me having t do something similar with a racing game I made previously.

i'm trying to get the enemy to stop when it's within a certain distance of the target, and it's proving to be a tougher challeng than expected.
after spending an embarrasingly long time trying to figure out why the `distance_to()` function doesn't work, I discovered that it can't be used on `Vector2` in godot 4.2.2, and that it's being added to that in godot 4.3

i'm now trying to figure out what set of conditions would check if a value is within a range

time's up, I haven't finished the enemy yet, they still flip arround when they reach their target, so i'll try and fix that next time. 



