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

someone said that the git CLI (command line interface) can pick up where it left off, so i've decided to try and learn it. i'm not completely new to the command line, but i am new to git, so this is likely going to be a big challenge. this is turning into a project in its own right 😅.

because i'm working on version control, you likely won't see this until it is finished, i'm not uploading this paragraph through the web UI, so if you see this, just know that I finally managed to get git working.

it works! i finally have it working, i had some issues about authenticating via the git CLI, turns out github has another CLI that you have to use for that, but i have finally managed to get git working. i'm very glad that i've managed to do this, because it hopefully means that i will be able to use it for future projects!


# hour 3

now that github is working I can resume work on the project. if i make any commits during the hour I will try to note them here.

### commit 1
for now I want to try and get the enemy to move towards the player instead of the cursor, i already covered how i'm going to do that last time.

### commit 2

now that i've done that, it's time to make the enemy do something other than walk towards the player. again, I will be doing this using signals, though this time i will use collision layers and an area2d.

I have an area2d which will act as the player's hurtbox. I have also set their collisions to only interact with the world, not enemies. this is so enemies no longer push the player, and the collisions don't stop the enemies hitting the hitbox.

the enemies have a very small change to their scene, only putting them on the new enemy layer. they interact with the world and the player.

i've implemented a very rudimentary health system, but have discovered a flaw. the area2D only checks for collisions when a body enters it, not while it's in it.i'm not sure how to fix this, though I think my current approach is flawed anyway.

i'm going to try and implement a hitbox/hurtbox system, where the hitboxes are used to deal damage, and hurtboxes are used to recieve damage. I can do this by creating scenes with scrpts attached to them.
i'm not sure how i would get these scenes to communicate with their parent though, which is an issue given I need the node to be able to be able to be attached to any scene.
most inter-scene communication (that i know of) uses signals, which I could supply arguments to allow configurable damage, though i'm not sure how I would designate a target.

I know you can supply a node as an argument, though i'm not very familiar with that system, so i would need to figure out how that works, I would also need to get the parent node, which i also don't know how to do.

after a quick google search, I found you can get a reference to the parent node.

I'm planning on having most of the code in the hurtbox, so once a hurtbox detects a hitbox, it somehow uses that reference to the parent to deal damage.




