
import re
from vehicle import Vehicle

def drawVehicle(file):
    f = open (file,"r")
    riga = f.readlines()
    f.read()
    print(f)
    vehicles = []
    findAts = []
    for r in riga : 
        # permette di non leggere la parte del goal
        if r.__contains__("goal"):
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


        
        if Vehicle.existIn(name,vehicles):
            vehicle = Vehicle.findVehicle(name, vehicles)
            vehicle.addCoord(element[1],element[2])
        else:
            vehicles.append(Vehicle(1,name,[[element[1],element[2]]]))
    return vehicles
    









