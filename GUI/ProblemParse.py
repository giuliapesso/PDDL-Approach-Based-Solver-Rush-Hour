
import re
def drawVeichle(file):
    f = open (file,"r")
    riga = f.readlines()
    vehicles = []
    xCoord = []
    yCoord = []
    for r in riga : 
        # utilizziamo
        if r.__contains__("(at") :
            """ withoutTab = r.removeprefix("        (at ")
            withoutNewLine = withoutTab.removesuffix(")\n")
            splitLine = withoutNewLine.split(" ") """
            #print(splitLine)
            splitLine = []
            splitLine = re.split("([/d/w]+)",r)

            print(splitLine)
    #print(vehicles)
    #print(xCoord)
    #print(yCoord)
    f.close()


drawVeichle("v3/Problems/rushHour_Problem4x4X.pddl")