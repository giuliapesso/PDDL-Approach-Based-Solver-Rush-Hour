from vehicle import Vehicle
import ProblemParse
import pygame
class Board:

    
    grid = [] 
    vehicles = []



        
    
    def __init__(self,problem):
        self.vehicles = ProblemParse.drawVehicle(problem)


    def drawVehicles(self,outerRect : pygame.Rect, screen):

        for e in self.vehicles:
            
            None                
    