from vehicle import Vehicle
import ProblemParse
import pygame

#imgRed = pygame.image.load("GUI/Images/RedIcon.png").convert()
class Board:

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

    # This method returns the virtual rect where will be drawn a cell of the grid, based on the coordinates
    # given as parameters
    def getRectFromCoord(self, coords : tuple[int,int]) -> pygame.Rect:

        left = self.centerRect.left + coords[0]*self.cellSize
        top = self.centerRect.top + coords[1]*self.cellSize
        return pygame.Rect(left,top,self.cellSize,self.cellSize)
    
    # This method draws a cell of the grid based on the rect obtained from getRectFromCoord, at the given coordinates
    def drawRectFromCoord(self,coords : tuple[int,int], color):
        pygame.draw.rect(self.screen,color, self.getRectFromCoord(coords))

    # This method draws a vehicle
    def drawVehicle(self, vehicle : Vehicle):
        for coords in vehicle.coords:
            self.drawRectFromCoord(coords,vehicle.color)

    # This method draws all the vehicles
    def drawVehicles(self):
        for e in self.vehicles:
            if (e.name=="red"):
                self.drawRed(e)
                continue
            self.drawVehicle(e)

    def drawRed(self,e:Vehicle):
        #rect=e.getRect(self.centerRect,self.cellSize)
        #self.screen.blit(imgRed,rect)
        pygame.draw.rect(self.screen,(255,0,0),e.getRect(self.centerRect,self.cellSize))


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
        self.screen.blit(font.render(txt, True, green, black), centro)

    def drawGoal(self):
        left = self.centerRect.left + self.goal[0]*self.cellSize+self.cellSize/2
        top = self.centerRect.top + self.goal[1]*self.cellSize+self.cellSize/2
        pygame.draw.circle(self.screen,(0,255,0),(left,top),self.cellSize/2)
    

    