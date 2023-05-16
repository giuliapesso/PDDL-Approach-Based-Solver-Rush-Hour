import re

# genera i next con le y
gridSize = 10
txt = "(next y{} y{})"
for i in range(gridSize-1):
    print(txt.format(i+2,i+1))

# genera i next con le x
txt = "(next x{} x{})"
for i in range(gridSize-1):
    print(txt.format(i+2,i+1))

#genera gli occupied dagli at
def leggiFile(str):
    f = open (str,"r")
    riga = f.readlines()
    f.read()
    return riga 

for f in leggiFile("v3/Problems/rushHour_Problem4x4XYtruck.pddl") :
    if "goal" in f:
            break
    found = re.findall("at[\d|\w| ]+",f)
    if found:
        elemento = found[0].split()
        txt = "(occupied {} {})"
        print(txt.format(elemento[2],elemento[3]))