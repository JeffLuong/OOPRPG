# OOP RPG

The goal is to write a simple role playing game, using Ruby & object oriented programming.

Classes we will probably want:  

1. Game
2. Party
3. Hero
4. Monster
5. Weapon
6. Shop

Things we will want:  

1. DRY DRY code
2. Be mindful of coupling
3. Methods which don't care which object they are being called on

The game should look like:  

1. Show user some potential party members
2. Let the user pick 2 for their party
3. Let the user choose to wander in the forest, or go to the shop
4. Forest
  - Random fight
  - Go home or wander more?
5. Shop
  - Buy items & equip
6. Fighting
  - Each member of the party can target a monster
  - They deal damage
  - Once the party is done, each monster then attacks a random party member
  - Loop until either the party or monsters are all dead
  - Each party member that survives gets XP & Gold
# OOPRPG
