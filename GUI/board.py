from vehicle import Vehicle
import ProblemParse
import pygame
class Board:

    
    grid = [] 
    vehicles = []
    screen : pygame.Surface
    centerRect : pygame.Rect

    #in pixel
    cellSize : int
    gridDim : int


        
    
    def __init__(self,problem,screen,centerRect,cellSize,gridDim):
        self.vehicles = ProblemParse.drawVehicle(problem)
        self.screen = screen
        self.centerRect = centerRect
        self.cellSize=cellSize
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
        return (int(xPixel//self.cellSize),int(yPixel//self.cellSize))
    
    #ricava cella della griglia in base alla coordinata
    def getRectFromCoord(self, coords : tuple[int,int]) -> pygame.Rect:
        left = self.centerRect.left + coords[0]*self.cellSize
        top = self.centerRect.top + coords[1]*self.cellSize
        return pygame.Rect(left,top,self.cellSize,self.cellSize)
    

    #def drawRectFromCoord(coords : tuple[int,int]):

    