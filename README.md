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

# hour 2

## finishing the enemy's movement
it's a couple days later, and i figured out that if a subtract the target position by the velocity, the result will be the difference between the two. if I do this in code before the if condition, I will be able to use that value in the condition.

i've done that ,and I now have the difference in positions between the two positions, so if the target is 1 px down left to the enemy, the difference would be (1,1), i just need to figure out how to turn that into a distance.
normally for this you would use pythagorean theorum, but that stops working once one of the two numbers is negative, while the other is positive. since I don't need the direction, I can just flip the negative number to a positive one.

i've now done that, to finish the formula I need to sqaure the numbers, which can be done with `^2`, but i also need to be able to square root the answer, which I don't know how to do.
I first found a reddit post asking how to do roots other than square and cube roots, but i couldn't understand what they meant, they did give code, but I decided to look around for a square root function for easier readability, especially given that I don't understand the code they gave, so would be completely unable to read it later.

found it, turns out it's `sqrt()`, I ended up just asking chatGPT, since there was no documentation to be seen on the official docs, and I didn't want to ask on the forms for something that should be so easy to find.

turns out that using `^` doesn't actually work, no idea where I got that idea from, but i can just replace it with either `pow()` or `\*\*`

it works! that was surprisingly hard and almost certainly overcomplicated, but it does work. i might try and turn it into my own function if I end up needing it again, but I honestly doubt I will.

## passing in the player's coordinates
I think the best approach to this would be an autoload combined with a `player_pos()` signal, I can declare the signal in an autoload, that way any scene can always know the player's position.
i've used signals before, it can be quite frustrating passing a signal from an autoload to a scene, though i've largly figured it out now.

steps:
	1) make an autoload and declare a signal in it, you can declare a signal using the `signal` keyword
	2) add any arguments in brackets after the signal name, like in a function
	3) connect the signal in script using `autoloadName.signalName.connect("func name")` with the func name being the function you want the signal to call.
	4) make the function as normal

that's the hour up, so i'll work on that next time. i'malso going to try and get a proper github client working so that I can commit within the hour rather than just at the end of it, but since i'm coding this on linux, that's easier said than done.
i'll update on the github client either in the next hour, or in its own section.

# github client
I managed to get a github client working, i'm still not fully confident with it, but I should be able to commit more frequently, and be able to use things like a .gitignore file.

of course right after writing this I run into issues with the github client,

I might have solved the issue, the repository is now called wave-survival-game because that is what it is called on my device. when publishing a commit the client always looks for a github repo matching the folder name, even if you have told it that the repo is actually named something different.

I solved all the issues with the client, only to find out that if the connection cuts out, even for a second, the entire upload fails.
this is a huge issue for me, as I have ridiculously bad wifi that consistently cuts out every couple of seconds, though only for a second at a time.
this means that I can't use git to upload files while the wifi is doing this. i've tried using a hotspot and mobile data, but that is also too inconsistent.
I'm uploading this from the website, hopefully someone can point me in the right direction for a soloution to this
