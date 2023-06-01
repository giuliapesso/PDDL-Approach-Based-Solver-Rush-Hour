from vehicle import Vehicle
import ProblemParse
import pygame


class Board:
    imgRed = pygame.image.load("GUI/Images/RedIcon.png")
    imgFlag = pygame.image.load("GUI/Images/flag.png")
    grid = [] 
    vehicles = list[Vehicle]
    screen : pygame.Surface
    centerRect : pygame.Rect
    goal : tuple[int,int]

    #in pixel
    cellSize : int
    gridDim : int
    
    # Constructor
    # Parameters:
    # - problem : problem file
    # - screen : window 
    # - centerRect : virtual rect on which the grid will be drawn
    # - cellSize : size of the cell
    # - gridDim : dimension of the grid
    def __init__(self,problem,screen,centerRect,cellSize,gridDim):
        self.vehicles = ProblemParse.drawVehicle(problem)
        self.screen = screen
        self.centerRect = centerRect
        self.cellSize=cellSize
        self.gridDim = gridDim
        self.goal=ProblemParse.findGoal(problem)
        self.imgRed = self.imgRed.convert_alpha()
        self.imgFlag = self.imgFlag.convert_alpha()
        

    # This method returns the virtual rect where will be drawn a cell of the grid, based on the coordinates
    # given as parameters
    # deprecato
    def getRectFromCoord(self, coords : tuple[int,int]) -> pygame.Rect:

        left = self.centerRect.left + coords[0]*self.cellSize
        top = self.centerRect.top + coords[1]*self.cellSize
        return pygame.Rect(left,top,self.cellSize,self.cellSize)
    
    # This method draws a cell of the grid based on the rect obtained from getRectFromCoord, at the given coordinates
    def drawRectFromCoord(self,coords : tuple[int,int], color):
        pygame.draw.rect(self.screen,color, self.getRectFromCoord(coords))

    # This method draws a vehicle
    def drawVehicle(self, vehicle : Vehicle):
        rect = vehicle.getRect(self.centerRect,self.cellSize)
        pygame.draw.rect(self.screen,vehicle.color,rect)
        #for coords in vehicle.coords:
            #self.drawRectFromCoord(coords,vehicle.color)

    # This method draws all the vehicles
    def drawVehicles(self):
        for e in self.vehicles:
            if (e.name=="red"):
                
                continue
            self.drawVehicle(e)

    def getRed(self) -> Vehicle:
        for vehicle in self.vehicles:
            if(vehicle.name=="red"):
                return vehicle

    def drawRed(self):
        e = self.getRed()
        rect=e.getRect(self.centerRect,self.cellSize)
        #imgRed = pygame.transform.scale(imgRed.convert_alpha(),rect.)
        #imgRed = pygame.transform.scale(imgRed,(rect.size)).convert()
        self.imgRed = pygame.transform.scale(self.imgRed,rect.size)
        self.screen.blit(self.imgRed,rect)
        #pygame.draw.rect(self.screen,(255,0,0),e.getRect(self.centerRect,self.cellSize))


    # This method applies the move given as parameter using the method of the Vehicle class
    def apply(self,move):
        # [veicolo, xDest, yDest]
        # Estrai veicolo -> findVehicle(move[0])
        vehicle = Vehicle.findVehicle(move[0],self.vehicles)
        vehicle.move([move[1],move[2]])
  
    # This method shows a label with the text given as parameter
    def showLabel(self, txt):
        font = pygame.font.Font('freesansbold.ttf', 80)
        green = (0,255,0)
        black = (0,0,0)
        left = self.centerRect.left
        top = self.centerRect.top+self.gridDim*self.cellSize
        centro = pygame.Rect(left,top,200,200)
        self.screen.blit(font.render(txt, True, black, (255,255,255)), centro)

    def drawGoal(self):
        pad = self.cellSize*0.1
        size = self.cellSize-pad*2
        left = self.centerRect.left + (self.goal[0]*self.cellSize)+pad
        top = self.centerRect.top + (self.goal[1]*self.cellSize)+pad
        #pygame.draw.circle(self.screen,(0,255,0),(left,top),self.cellSize/2)
        
        rect = pygame.Rect(left,top,size,size)
        self.imgFlag= pygame.transform.scale(self.imgFlag,(size,size))
        self.screen.blit(self.imgFlag,rect)
    

    