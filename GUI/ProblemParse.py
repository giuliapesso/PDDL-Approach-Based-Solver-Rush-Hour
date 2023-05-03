
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
        nome = element[0]


        
        if esisteIn(nome,vehicles):
            veicolo = estraiVeicolo(nome, vehicles)
            veicolo.addCoord(element[1],element[2])
        else:
            vehicles.append(Vehicle(1,nome,[[element[1],element[2]]]))
    return vehicles
    

  
def esisteIn(nome : str,vehicles : list[Vehicle]):
    for element in vehicles:
        if element.name==nome:
            return True
    return False

def estraiVeicolo(nome,vehicles : list[Vehicle]):
    for element in vehicles:
        if element.name==nome:
            return element







