# MKS22X-Minicraft

# Description

The game is a top down version of Minecraft where you have to gather resources and survive. The player starts off with the most basic tools created by gathering wood from trees. As the player progresses further into the game, they can mine stronger ore such as iron and moodstone. The material gathered can be used to create items such as craft stations like a furnace. The material can also be used to create better tools such as a stone pickaxe. There is also armor that can be created and equipped by the player to reduce damage taken. There are two stats to keep in check throughout the game: health and stamina. 


# How to Run

# How to Play
```
i to open inventory
```
While inventory is opened:
```
o to interact with the item 
w,s to move pointer up and down 
u to unequip the current tool 
i to close inventory
```
While station menu is opened: 
```
o to interact with the itme
w,s to move pointer up and down
↑,↓ to move second pointer up and down
p to pickup the station
i to close station menu
```
While invetory is closed:
```
p to punch or use equipped tool or place station
o to open and use a station
w,a,s,d to move around
k to activate sprinting (drains stamina)
```
# DevLog

## 5-20-19
### Moody
Today was the first day of serious work on this project. We got more familiar
with how processing deals with keypresses, and implemented a "keypress" array to
keep track of which keys are being pushed at any given moment. We also worked on
a central "player" with the "world" moving around it. This is all implemented in
the graphics though, we need to revamp and move that logic into a lower more OO level
At home I worked on making the player rectangle lean in a direction to suggest that
it's the figure doing the action
### Tyler
Today, Moody and I worked together to code movement using w,a,s,d. At first, the movement was clunky and did not move diagonally. Eventually, we got it to move around smoothly.

## 5-21-19
### Moody
We worked on the tile class and the inital implementation of grass, plus
graphics to handle world edge (ocean). I made boundaries for each tile have a
border such that differentiating tiles is easier.
### Tyler
Today, Moody and I worked together to created a class for tile, grass, stone, and made a collideable interface. We also added the grass and water at the border of the world.

## 5-22-19
### Tyler
Today, I worked on inventory and item class. For inventory, I did part of the display function. I added a pause to the game so when you open inventory, the player cannot move. Item class is abstract and has the children tool,resource, armor, and station. Each of these items can be picked up and added to the inventory.

## 5-23-19
### Moody
I refactored a bunch of Tylers inventory code (but that's still not entirely done)
and put some time into the collision detection. The important thing that I got from
today is the paradigm to transform my dx and dy into their respective tile, with
respect to the player.
### Tyler
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

## 5-24-19
### Tyler
Today, I worked on innventory, tool, armor, and station class. I added a pointer to the inventory and a way for the player to move it up and down. I also added a way to interact
with the items in the inventory. Under the game class, the keyPresssed function was modified to contain a way for the pointer to stay inside the inventory menu. Also, added new
interface interactable, which will be implemented by armor, tool, and station class. This interface will allow the player to use the item in the inventory. For the tool class, I
added a constructor. For armor and station class, I changed the constructor. In station, I added to the craft method to add any interactable items to the interactables list.
### Moody
Today involved mostly a lot of whiteboarding and math to calculate what Tile the player is on given their current dx and dy.

## 5-28-19
### Tyler
Today, I updated the README with the controls to play our game and the description of our game. I also worked on the inventory class. I added a menu to show which armor is equipped
and how much damage reduction the player currently has. In addition, I added a way to unequip the current tool the player is holding. I added a tree class. For player class, I added
a method that checks if new armor has been equipped, so the damage reduction gets updated. Under the armor class, I added a way to equip the armor from the inventory. Finally, I
worked on tool class. I added a method for the player to equip the tool from the inventory and swap between the tools.
### Moody
Created a sister array to keyz[] called canWalk[]. It will hold the current "walkability" of each of the cardinal direction. I also had the realization that there is no point in
checking for colliding every frame, opting to change the boolean at every keypress. I also made the drawMode into CENTER, to help with colliding and drawing in the future.

## 5-29-19
### Tyler
Today, I found images for tree, stone, and grass. I implemented these images into the code.
### Moody
Realized Tile needed some serious revamping and opted to create TestTile to facilitate new changes. Resized the world to a 10 by 10 to make this easier.

## 5-30-19
### Tyler
Today, I worked on readjusting the inventory. After Moody redid the tiless, the inventory menus were not in sync. I redid the invetory class by using an array list. I debugged all
the code that had to do with the inventory. I also addedd a way for the pointer to cycle when only moving upwards. I worked on armor, tool, item, station, resource, and the game
class. Finally, I deleted the Interactable interface and moved all its methods to the item class. I made them all abstract methods.
### Moody
TestTile now can be a stone.

## 5-31-19
### Tyler
Today, I worked on the station class. I worked on a way for the stations to be placed. I added a way for stations to be equipped via inventory. While equipped, the player can either
place down the station or unequip the station. They are not allowed to punch or use a tool. To place or unequip the station, the player can use the same keys as they would to punch
or unequip a tool.

## 6-1-19
### Tyler
Today, I worked on the inventory, player, resource, and the game class. Under the inventory class, I added a method that unequips armor. This method cannot be used by player and can
only occur when putting on a different armor piece for the same slot. For resource class, I added a constructor to create the five different resources in the game: wood, sand,
stone, iron, and moodstone. For player, I added health and stamina. These two stats are displayed in the top right corner of the game. Finally, under the game class, I added a new
key control: k. By pressing k, sprinting gets activaated, which drains stamina if you move around.
### Moody
Binary searching through the world array to find the relevant tiles in terms of colliding and worked on a valid enough binary search algorithm that can select and collide check
nearby stones. I'm also attempting to keep the calculations in terms of the pixel locations of an object, to keep it more accurate in terms of radious checks.

## 6-2-19
### Tyler
Today, I worked on station, and game class. For station, I fixed the placement of the stations, so now after placing, stations do not move around. I also added a way for the player to craft the items they want. If the player already has the armor piece or tool in their inventory, the item will not be crafted. For the game class, I fixed up sprinting. It no longer uses twice as much stamina when moving diagonally. In addition, I added a new class called consumable. This class is for foods that player can eat to regain health. The consumable class has two different foods: apple and bread. Apple heals for 10 hp, while bread heals for 20. However, the player's health cannot go above 100. 
Today, I worked on station, and game class. For station, I fixed the placement of the stations, so now after placing, stations do not move around. For the game class, I fixed up
sprinting. It no longer uses twice as much stamina when moving diagonally.
### Moody
Created the stones arrayList that keeps track of all the stones in the world and did some research into the Comparator data structure, so I can sort the stones by either x or y.
Finally, I made the choice to keep all calculations in terms of the coordinates on the tile array. This made scaling by the tile size during calculations necessary.

## 6-3-19
### Moody
Realized that there was a second draw for a rectangle under every grass tile and removed that. This sped up the game immensely. Rather than binary searching all tiles, player
now checks tiles in a 3 by 3 radius for collision. Proper colliding is also finally implemented.


## 6-4-19
### Tyler
Today, I worked on the player, testtile, and game class. I added a new key press, p. By pressing p while a station menu is displayed allows you to pickup the station. I also added comments to all the classes I worked on. For player class, I updated the punch so stones can only be broken by pickaxes. Trees can be broken by fist or axes. However, when punching with fists, the player loses health. Axes do twice as much damage to trees. When broken, trees have a 70% chance of giving the player an apple. For the testtile class, I added a way for the tile to be a tree. I also added a way for players to gain resources after breaking a tree or stone. After breaking a tree or stone, the resource will be automatically added into the inventory.
