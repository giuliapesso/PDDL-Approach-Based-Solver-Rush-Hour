# Sitemi_Intelligenti
In this repository you can find:
- GUI -> it contains all the python files needed to represent the graphical user interface of the game "Rush Hour". 
- v1, v2, v3 -> three different versions of the game "Rush Hour":
  - v1: 
    A. Only vehicle of type car (2 cells) are supported
    B. Cells are represented by objects of type position
    C. There are 2 actions: one for the horizontal movement, one for the vertical movement
  - v2: 
    A. Three types of vehicles (motorcylce = 1 cell, car = 2 cells, truck = 3 cells) are supported
    B. Cells are represented by objects of type position
    C. There are 6 actions, 2 for each type of vehicle: one for the horizontal movement, one for the vertical movement
  - v3: 
    A. Three types of vehicles (motorcylce = 1 cell, car = 2 cells, truck = 3 cells) are supported
    B. Cells are represented by their coordinates, x and y, which are objects of type position
    C. There are 6 actions, 2 for each type of vehicle: one for the horizontal movement, one for the vertical movement

To visualize a found plan for a specific rush hour problem, run the "main.py" file in the GUI directory. 
You are asked to load the problem file from your explorer directory.
The problem will be solved based on the domain file specified for the specific version of the "Rush Hour" game, using the solver that you can find at http://planning.domains/. 
If a plan is found, you can visualize each step by pressing the arrow up key until the goal is reached. At that point the "You win!" label will appear on the screen.
If a plan isn't found or if the problem is unsolvable, the "Unsolvable" label will appear immediately. 

If you are interested only at the plan you can use ENHSP solver.
Instructions at the following link : https://gitlab.com/enricos83/ENHSP-Public    
