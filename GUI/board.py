from vehicle import Vehicle
import ProblemParse
import pygame
class Board:

    
    grid = [] 
    vehicles = []
    screen : pygame.Surface
    centerRect : pygame.Rect

    #in pixel
    gridSize : int
    gridDim : int


        
    
    def __init__(self,problem,screen,centerRect,gridSize,gridDim):
        self.vehicles = ProblemParse.drawVehicle(problem)
        self.screen = screen
        self.centerRect = centerRect
        self.gridSize=gridSize
        self.gridDim = gridDim

    def drawVehicles(self):

        for e in self.vehicles:
            
            None

    # ritorna coordinate x y della griglia in base alle coordinate in pixel
    def getCoord(self,mousePos : tuple[int,int]) -> tuple[int,int]:
        #distanza X e y  dalla quadrato centrale
        xPixel = mousePos[0]-self.centerRect.left
        yPixel = mousePos[1]-self.centerRect.top
        if (xPixel<0 or yPixel):
            None
            #raise Exception("stai clickando fuori dalla griglia")
        return (int(xPixel//self.gridSize),int(yPixel//self.gridSize))
    
    
    
    