
import solverScript
import re

# Parameters: problem -> file problem
# The variable file is used to store the plan file returned by the solver for the specified problem file.
# The plan file is then opened in order to be read.
# From the plan file's lines we remove the parentheses, and we split the lines into their elements, which are:
# - rSplit[1] = name of the vehicle to be moved
# - rSplit[2] = coordinate that doesn't change during the movement
# - rSPlit[-1] = last element of the line, that indicates the coordinate where the vehicle is moving to 
# We add these elements to the array that contains all the plan actions, called movesPddl. 
# For each move contained in movesPddl, we assign the variables xDest and yDest to the right value.
# Return: moves -> list of moves to be executed 

def extractPlan(problem):
    file = solverScript.solve(problem=problem)
    
    righe=open(file.name, "r").readlines()
    movesPddl = []
    moves = []
    for r in righe:
        r = re.sub("\(|\)","",r)
        rSplit = r.split()
        
        movesPddl.append([rSplit[1],rSplit[2],rSplit[-1]])
    file.close()
    #print(movesPddl)

    for move in movesPddl:
        if str(move[1]).startswith('x'):
            xDest = int(re.sub("x|y","",move[2]))-1
            yDest = int(re.sub("x|y","",move[1]))-1
        if str(move[1]).startswith('y'):
            yDest = int(re.sub("x|y","",move[2]))-1
            xDest = int(re.sub("x|y","",move[1]))-1

        moves.append([move[0],xDest,yDest])
    return moves

 # (move [xDest, yDest]) yDest = xEstratta, xDest = ultimaCoord
# - Se preceduto da y -> si muove ver -> la prima coord (x = col) resta uguale


