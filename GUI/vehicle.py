#serve solo per usare il type Vehicle dentro la definizione della stessa
from __future__ import annotations
import numpy as np

class Vehicle:
    dim : int #forse non serve
    name: str
    coords = [[int,int]]
    color = tuple[int,int,int]


    def __init__(self,dim,name,coords) -> None:
        self.dim = dim
        self.name = name
        self.coords = coords 
        if name == "red":
            self.color = (255,0,0)
        else:
            #genera colore rgb con numpy
            self.color = list (np.random.choice(range(255),size=3))

    def addCoord(self,x : int , y : int):
        self.coords.append([x,y])
        self.dim = self.dim+1


    def move(self):

        self.coords = [(0,0)]


    def __str__(self) -> str:
        txt = "nome: {}, dim, {} coordinate:{}"
        return txt.format(self.name,self.dim,self.coords)
    
      
    def existIn(name : str,vehicles):
        for element in vehicles:
            if element.name==name:
                return True
        return False

    def findVehicle(name,vehicles : list[Vehicle]) -> Vehicle:
        for element in vehicles:
            if element.name==name:
                return element



