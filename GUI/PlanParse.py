
import solverScript

import re
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
    
   

# Estraiamo primo elemento = veicolo
# Cerchiamo veicolo nella lista veicoli
# Codifica coordinate spostamento:
# In pddl: x = riga; In python x = colonna
# - Se preceduto da x -> si muove hor -> la seconda coord (y = riga) resta uguale

 # (move [xDest, yDest]) yDest = xEstratta, xDest = ultimaCoord
# - Se preceduto da y -> si muove ver -> la prima coord (x = col) resta uguale


