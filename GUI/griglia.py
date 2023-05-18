
import pygame

COLORE_GRIGLIA = (0,0,0)
SPESSORE_GRIGLIA = 2
class GrigliaVuota():

    outerRect: pygame.Rect
    gridSize : int
    cellSize : int

    # Constructor
    # Parameters:
    # - firstRect : the virtual rect where the grid will be drawn
    # - gridSize : dimension of the grid
    def __init__(self,firstRect : pygame.Rect,gridSize :int):
        self.outerRect = firstRect
        self.gridSize = gridSize
        self.cellSize = firstRect.width/gridSize

    # This method draws the grid
    def drawGriglia(self, screen):
        cella = pygame.Rect(self.outerRect.left,self.outerRect.top
                            ,self.cellSize,self.cellSize)
        
        pygame.draw.rect(screen,COLORE_GRIGLIA,self.outerRect,SPESSORE_GRIGLIA+1)
        
        for row in range(self.gridSize):
            for column in range (self.gridSize):
                pygame.draw.rect(screen,COLORE_GRIGLIA,
                                 pygame.Rect(self.outerRect.left+column*self.cellSize,
                                             self.outerRect.top+row*self.cellSize
                            ,self.cellSize,self.cellSize),
                            SPESSORE_GRIGLIA)

             








