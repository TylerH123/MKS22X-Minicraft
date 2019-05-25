# MKS22X-Minicraft

#### DevLog Moody
## 05-20-19
Today was the first day of serious work on this project. We got more familiar
with how processing deals with keypresses, and implemented a "keypress" array to
keep track of which keys are being pushed at any given moment. We also worked on
a central "player" with the "world" moving around it. This is all implemented in
the graphics though, we need to revamp and move that logic into a lower more OO level
At home I worked on making the player rectangle lean in a direction to suggest that
it's the figure doing the action

## 05-21-19
We worked on the tile class and the inital implementation of grass, plus
graphics to handle world edge (ocean). I made boundaries for each tile have a
border such that differentiating tiles is easier.

## 05-23-19
I refactored a bunch of Tylers inventory code (but that's still not entirely done)
and put some time into the collision detection. The important thing that I got from
today is the paradigm to transform my dx and dy into their respective tile, with
respect to the player.

#### DevLog Tyler
## 05-20-19
Today, Moody and I worked together to code movement using w,a,s,d. At first, the movement was clunky and did not move diagonally. Eventually, we got it to move around smoothly.
## 05-21-19
Today, Moody and I worked together to created a class for tile, grass, stone, and made a collideable interface. We also added the grass and water at the border of the world.
## 05-22-19
Today, I worked on inventory and item class. For inventory, I did part of the display function. I added a pause to the game so when you open inventory, the player cannot move. Item class is abstract and has the children tool,resource, armor, and station. Each of these items can be picked up and added to the inventory.
## 05-23-19
Today, I worked on inventory, station, and armor class. For armor, I added a way
to determine the damage reduction for each piece of armor. I also added a constructor
that can become different pieces of armor at different tiers. A method to determine
if a certain items can be created under the station class. This method was then
turned into the method to create the item. Another method for station class was
added to place down station. For now, it will be a simple rectangle, but later
there will be a picture of the station. The game class was updated to have a 2D
array which included the cost to create the item and if the item didn't have a tier,
the second value would be the ID of the resource needed. The game class also got
a list for item names. This list is used for displaying the items in your inventory.
Under inventory class, I added an add and remove function to update the values in
inventory. In addition, I added to the display method so it can display the items
in the inventory. The armor and station class both have a way to add to this list
in their constructor.
## 05-23-19
Today, I worked on innventory, tool, armor, and station class. I added a pointer to the inventory and a way for the player to move it up and down. I also added a way to interact with the items in the inventory. Under the game class, the keyPresssed function was modified to contain a way for the pointer to stay inside the inventory menu. Also, added new interface interactable, which will be implemented by armor, tool, and station class. This interface will allow the player to use the item in the inventory. For the tool class, I added a constructor. For armor and station class, I changed the constructor. In station, I added to the craft method to add any interactable items to the interactables list. 
