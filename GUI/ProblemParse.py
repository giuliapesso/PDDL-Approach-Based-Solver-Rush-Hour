
import re
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
        # utilizziamo
        found = re.findall("at[\d|\w| ]+",r)

        if found:
         
            found = re.sub("at","",found[0])
            #print(found)
            #ciao=found.split(" ")
            #print(found.split())
            findAts.append(found.split())

        
    
    #print(vehicles)
    #print(xCoord)
    #print(yCoord)
    f.close()

    print(findAts)


drawVeichle("v3/Problems/rushHour_Problem4x4X.pddl")