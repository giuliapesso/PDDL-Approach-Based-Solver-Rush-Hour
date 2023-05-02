class Vehicle:
    dim : int #forse non serve
    name: str
    coords = []

    def __init__(self,dim,name,coords) -> None:
        self.dim = dim
        self.name = name
        self.coords = coords

    def move(self):
        self.coords = [(0,0)]

    




