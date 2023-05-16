
import re
from vehicle import Vehicle

# Parameters: str -> name of the file to be read
# Return: f -> the opened file, riga -> the file's lines
def leggiFile(str):
    f = open(str,"r")
    riga = f.readlines()
    f.read()
    return f,riga

# Parameters: file -> the problem file
# The problem file is read in order to extract the dimension of the game board. 
# To do this, we take all the declared coordinates inside the problem file, we remove "x" and "y" from their variables names,
# and then we take the maximum of the found numbers as the board dimension.
# Return: the maximum of the found numbers

def findBoardDim(file):
    f,riga = leggiFile(file)
    numbers = []
    for r in riga :
        found = re.findall("[\d|\w| ]+- position",r)
        if found:
            break
    f.close()

    strNumbers = (re.sub("x|y|-|position","",found[0]).split())
    for e in strNumbers:
        numbers.append(int(e))
    return max(numbers)

# Parameters: file -> the problem file
# This method is used to obtained the positions where all the problem vehicles are located.
# We read the file until the "goal" section is reached.
# We find all the lines in which appears the predicate that starts with "at". 
# To these lines, "at" is removed and they are splits into their elements, which are: vehicle name, x coordinate, y coordinate.
# For each found lines we define:
# - name = variable that stores the name of the vehicle specified 
# - riga = variable that stores the x coordinate specified in the problem minus 1 in order to start from 0
# - colonna = variable that stores the y coordinate specified in the problem minus 1 in order to start from 0
# We check if a vehicle called "name" exists in the list of declared vehicles from class Vehicle:
# - if it returns true, then the new couple of (x,y) coordinates is added to the list of coordinates for that vehicle;
# - if it returns false, then the new vehicle is added to vehicles, and also its coordinate. 
# Return: vehicles -> list of vehicles

def drawVehicle(file):
    f,riga = leggiFile(file)
    vehicles = []
    findAts = []
    for r in riga : 
        # permette di non leggere la parte del goal
        if "goal" in r:
            break
        # si usano le espressioni regoli per ricavare le stringhe che contengono at nel problem pddl
        found = re.findall("at[\d|\w| ]+",r)
        # se trovo "at" 
        if found:
            # dalla stringa rimuovo solo la parte "at" e rimane il veicolo e le coordinate x y
            found = re.sub("at|x|y","",found[0])
            findAts.append(found)
    f.close()

    for element in findAts:
        element = element.split()
        name = element[0]

        #in .pddl i mie at (x e y) indicano riga e colonna della matrice
        #quindi qui y è riga-1 e x colonna-1
        riga = int(element[1])
        colonna= int(element[2])

        x = colonna-1
        y = riga-1

        if Vehicle.existIn(name,vehicles):
            vehicle = Vehicle.findVehicle(name, vehicles)
            vehicle.addCoord(x,y)
        else:
            vehicles.append(Vehicle(1,name,[[x,y]]))
    return vehicles

    









