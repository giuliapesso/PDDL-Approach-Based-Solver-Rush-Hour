import re

# genera i next con le y
txt = "(next y{} y{})"
for i in range(15):
    print(txt.format(i+1,i))

# genera i next con le x
txt = "(next x{} x{})"
for i in range(15):
    print(txt.format(i+1,i))

#genera gli occupied dagli at
def leggiFile(str):
    f = open (str,"r")
    riga = f.readlines()
    f.read()
    return riga 

for f in leggiFile("./rushHour_Problem15x15XY.pddl") :
    if "goal" in f:
            break
    found = re.findall("at[\d|\w| ]+",f)
    if found:
        elemento = found[0].split()
        txt = "(occupied {} {})"
        print(txt.format(elemento[2],elemento[3]))