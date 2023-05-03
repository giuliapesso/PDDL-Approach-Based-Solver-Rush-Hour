def drawVeichle(file):
    f = open (file,"r")
    riga = f.readlines()
    vehicles = []
    xCoord = []
    yCoord = []
    for r in riga : 
        if r.__contains__("(at") :
            withoutTab = r.removeprefix("        (at ")
            withoutNewLine = withoutTab.removesuffix(")\n")
            splitLine = withoutNewLine.split(" ")
            #print(splitLine)

            vehicles.append(splitLine[0])
            xCoord.append(splitLine[1])
            yCoord.append(splitLine[2])
    print(vehicles)
    print(xCoord)
    print(yCoord)
    f.close()
