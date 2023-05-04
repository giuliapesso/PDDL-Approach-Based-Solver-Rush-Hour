
import re
from vehicle import Vehicle
def leggiFile(str):
    f = open (str,"r")
    riga = f.readlines()
    f.read()
    return f,riga

def findBoardDim(file):
    f,riga =leggiFile(file)
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

    









