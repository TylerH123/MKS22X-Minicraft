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


#### DevLog Tyler
## 05-20-19
Today, Moody and I worked together to code movement using w,a,s,d. At first, the movement was clunky and did not move diagonally. Eventually, we got it to move around smoothly.
## 05-21-19
Today, Moody and I worked together to created a class for tile, grass, stone, and made a collideable interface. We also added the grass and water at the border of the world. 
## 05-22-19
Today, I worked on inventory and item class. For inventory, I did part of the display function. I added a pause to the game so when you open inventory, the player cannot move. Item class is abstract and has the children tool,resource, armor, and station. Each of these items can be picked up and added to the inventory. 
