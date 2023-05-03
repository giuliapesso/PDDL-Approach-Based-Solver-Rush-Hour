class Vehicle:
    dim : int #forse non serve
    name: str
    coords = [[int,int]]

    def __init__(self,dim,name,coords) -> None:
        self.dim = dim
        self.name = name
        self.coords = coords

    def addCoord(self,x : int , y : int):
        self.coords.append([x,y])
        self.dim = self.dim+1;

    def move(self):
        self.coords = [(0,0)]

    




