
import re

from vehicle import Vehicle
def drawVeichle(file):
    f = open (file,"r")
    riga = f.readlines()
    f.read()
    print(f)
    vehicles = []
    xCoord = []
    yCoord = []
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
            found = re.sub("at","",found[0])
            findAts.append(found)
    f.close()

    #print(findAts)

    for str in findAts:
        str = str.split()

        
        #vehicles.append(Vehicle(1))
        print(str)


drawVeichle("v3/Problems/rushHour_Problem4x4X.pddl")