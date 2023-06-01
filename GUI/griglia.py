
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
        
        for i in range(self.gridSize):
            #hor
            posInit =(self.outerRect.left,self.outerRect.top+i*self.cellSize)
            posFin = (posInit[0]+self.cellSize*self.gridSize,posInit[1])
            pygame.draw.line(
                screen,COLORE_GRIGLIA,posInit,posFin,SPESSORE_GRIGLIA
            )

            #vert
            posInit =(self.outerRect.left+i*self.cellSize,self.outerRect.top)
            posFin = (posInit[0],posInit[1]+self.cellSize*self.gridSize)
            pygame.draw.line(
                screen,COLORE_GRIGLIA,posInit,posFin,SPESSORE_GRIGLIA
            )

             








