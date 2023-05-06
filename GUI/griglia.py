
import pygame

COLORE_GRIGLIA = (0,0,0)
SPESSORE_GRIGLIA = 2
class GrigliaVuota():

    outerRect: pygame.Rect
    gridSize : int
    cellSize : int
    # rect iniziale saràa il rettangolo e size Griglia se è 8 sigifnica che sarà un 8x8
    def __init__(self,rectIniziale : pygame.Rect,sizeGriglia :int):
        self.outerRect = rectIniziale
        self.gridSize = sizeGriglia
        self.cellSize = rectIniziale.width/sizeGriglia

    

    def printGriglia(self):
        print(5)


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

             








