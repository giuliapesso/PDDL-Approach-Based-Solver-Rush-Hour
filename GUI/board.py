from vehicle import Vehicle
import ProblemParse
import pygame
class Board:

    grid = [] 
    vehicles = list[Vehicle]
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
            self.drawVehicle(e)
    def drawVehicle(self, vehicle : Vehicle):
        for coords in vehicle.coords:
            self.drawRectFromCoord(coords,vehicle.color)

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
    

    def drawRectFromCoord(self,coords : tuple[int,int], color):
        pygame.draw.rect(self.screen,color, self.getRectFromCoord(coords))

    def applica(self,move):
        # [veicolo, xDest, yDest]
        # Estrai veicolo -> findVehicle(move[0])
        # 
        vehicle = Vehicle.findVehicle(move[0],self.vehicles)
        vehicle.move([move[1],move[2]])
  
    def mostraFinito(self, txt):
        font = pygame.font.Font('freesansbold.ttf', 80)
        green = (0,255,0)
        black = (0,0,0)
        left = self.centerRect.left
        top = self.centerRect.top+self.gridDim*self.cellSize
        centro = pygame.Rect(left,top,200,200)
        self.screen.blit(font.render(txt, True, green, black), centro)
    

    