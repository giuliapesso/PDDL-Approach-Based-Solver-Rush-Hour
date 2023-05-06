#serve solo per usare il type Vehicle dentro la definizione della stessa
from __future__ import annotations
import math
import numpy as np

class Vehicle:
    dim : int #forse non serve
    name: str
    coords = list[tuple[int,int]]
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


   
    def move(self, coordDest):
        self.coords.remove(self.findFarthestFrom(coordDest))
        self.coords.append(coordDest)

        print(self.coords)
    #eh faccio cose un po strane per ricavare il punto piu lontano
    def findFarthestFrom(self,  coordFrom : tuple[int,int]) -> tuple[int,int]:
        dict = {}
        for coord in self.coords:
            dict[self.findDistance(coord,coordFrom)]=coord
        
        
        return dict[(max(dict.keys()))]


     #TROVO la distanza tra due coordinate
    def findDistance(self,coord1:tuple[int,int], coord2:tuple[int,int]):
        return math.sqrt((coord1[0] - coord2[0])**2 + (coord1[1] - coord2[1])**2)
            

      
    def existIn(name : str,vehicles):
        for element in vehicles:
            if element.name==name:
                return True
        return False

    def findVehicle(name,vehicles : list[Vehicle]) -> Vehicle:
        for element in vehicles:
            if element.name==name:
                return element
            
    def __str__(self) -> str:
        txt = "nome: {}, dim, {} coordinate:{}"
        return txt.format(self.name,self.dim,self.coords)
    
