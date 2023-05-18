#serve solo per usare il type Vehicle dentro la definizione della stessa
from __future__ import annotations
import math
import numpy as np

class Vehicle:

    dim : int 
    name: str
    coords = list[tuple[int,int]]
    color = tuple[int,int,int]

    # Constructor
    # Parameters:
    # - dim : number of cells occupied by the vehicle
    # - name : name of the vehicle
    # - coords : list of coordinates occupied by the vehicle
    # - color : random color assigned to the vehicle

    def __init__(self,dim,name,coords) -> None:
        self.dim = dim
        self.name = name
        self.coords = coords 
        if name == "red":
            self.color = (255,0,0)
        else:
            #genera colore rgb con numpy
            self.color = list (np.random.choice(range(255),size=3))

    # This method adds the coordinates x and y, given as parameters, 
    # to the list of coordinates occupied by the vehicle
    def addCoord(self,x : int , y : int):
        self.coords.append([x,y])
        self.dim = self.dim+1

    # This method returns an object of type Vehicle that has the same name as the one given as parameter
    def findVehicle(name,vehicles : list[Vehicle]) -> Vehicle:
        for element in vehicles:
            if element.name==name:
                return element

    # This method returns true if exists a vehicle in the list of vehicles 
    # that has the same name as the one given as parameter. It returns False otherwise. 
    def existIn(name : str,vehicles):
        for element in vehicles:
            if element.name==name:
                return True
        return False
    

     # This method returns the distance between the two coordinates given as parameters
    def findDistance(self,coord1:tuple[int,int], coord2:tuple[int,int]):
        return math.sqrt((coord1[0] - coord2[0])**2 + (coord1[1] - coord2[1])**2)
    
    # This method returns the coordinate associated to the max distance from coordFrom, given as parameter
    def findFarthestFrom(self,  coordFrom : tuple[int,int]) -> tuple[int,int]:
        dict = {}
        for coord in self.coords:
            dict[self.findDistance(coord,coordFrom)]=coord
        return dict[(max(dict.keys()))]

    # This method moves the vehicle: this means that it removes the coordinate that is the farthest from coordDest
    # and adds coordDest to coords
    def move(self, coordDest):
        self.coords.remove(self.findFarthestFrom(coordDest))
        self.coords.append(coordDest)
        print(self.coords)

    # To string
    def __str__(self) -> str:
        txt = "nome: {}, dim, {} coordinate:{}"
        return txt.format(self.name,self.dim,self.coords)
    
