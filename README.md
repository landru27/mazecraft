# mazecraft
utilities for constructing a maze in a Minecraft world


###  overview

[create a new world with Minecraft]

[use mazemaker.sh to create a maze blueprint]

[use worldcraft and the maze blueprint to edit the maze into the game world]

[use nbtcraft to set the player's starting position to inside the maze]
[use nbtcraft to set the game mode as necessary]
... GameType
... playerGameType
... allowCommands
... invulnerable
... mayfly
... instabuild
... mayBuild
... Pos
... SpawnX, Y, Z


### the challenge

```
- starting situation
  - above maze
  - drop from some height down into a cage
  - in a 1x1 box of iron bars, permitting a limited view around, across the maze
  - with a trapdoor at the feet
  - directly above the start of the maze
  - Adventure Mode, to disallow breaking blocks and building steps up out of the maze

- foundation of 32 layers of bedrock
  - fills in any open space below that might have or generate mobs

- walls 4 blocks high
  - made of stone
  - with occassional stone brick
  - and occassional mossy cobblestone

- corridors 3 blocks wide

- start is marked as an iron door, with no button on the inside of the maze
- goal is marked as an iron door, this time with a button on the inside of the maze

- maybe have a few chickens in the maze, to add a dynamic distraction, to induce the need to focus on what's important
```

