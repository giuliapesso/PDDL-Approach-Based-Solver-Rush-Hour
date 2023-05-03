import pygame
from griglia import GrigliaVuota

pygame.init()


SCREEN_WIDTH= 800
SCREEN_HEIGHT = 600

GRID_SIZE = 400
N_GRID = 3


RED = (255,0,0)
WHITE = (255,255,255)
clock = pygame.time.Clock()
screen = pygame.display.set_mode((SCREEN_WIDTH,SCREEN_HEIGHT))
screen.fill(WHITE)
#quadrato = pygame.Rect(0,0,GRID_SIZE,GRID_SIZE)
quadratoCentrale = pygame.Rect(screen.get_rect().centerx-GRID_SIZE/2,
                        screen.get_rect().centery-GRID_SIZE/2,
                        GRID_SIZE,GRID_SIZE)
quadratoSchermo = screen.get_rect()


#quadratoVuoto = pygame.Rect()

done = False
while not done:
    clock.tick(2)
    #print(clock.get_fps())
    #pygame.draw.rect(screen,RED,quadrato,2)
    #pygame.draw.rect(screen,RED,quadratoCentrale,2)
    
    #print(GrigliaVuota(quadratoCentrale,2).cellSize)
    GrigliaVuota(quadratoCentrale,N_GRID).drawGriglia(screen)

    #quadratoCentrale.left=quadratoCentrale.left+2
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            done = True



    pygame.display.update()

pygame.quit()