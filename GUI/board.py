from vehicle import Vehicle
import ProblemParse
import pygame
class Board:

    
    grid = [] 
    vehicles = []
    screen : pygame.Surface
    centerRect : pygame.Rect


 

        
    
    def __init__(self,problem,screen,centerRect):
        self.vehicles = ProblemParse.drawVehicle(problem)
        self.screen = screen
        self.centerRect = centerRect


    def drawVehicles(self):

        for e in self.vehicles:
            
            None                
    