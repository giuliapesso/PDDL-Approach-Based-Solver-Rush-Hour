import pygame
from griglia import GrigliaVuota
from board import Board
import ProblemParse
import PlanParse
from tkinter import filedialog as fd

filename = fd.askopenfilename(
    title="Select a problem",
    initialdir="./v3/Problems",
    filetypes=[("text files","*.pddl")])

pygame.init()

SCREEN_WIDTH= 800
SCREEN_HEIGHT = 600
GRID_SIZE = 400
#problem = "v3/Problems/rushHour_Problem6x6XY.pddl"
problem = filename
N_GRID = ProblemParse.findBoardDim(problem)
print(ProblemParse.findGoal(problem))
CELL_SIZE = GRID_SIZE/N_GRID
RED = (255,0,0)
WHITE = (255,255,255)
clock = pygame.time.Clock()
screen = pygame.display.set_mode((SCREEN_WIDTH,SCREEN_HEIGHT))
screen.fill(WHITE)
quadratoCentrale = pygame.Rect(screen.get_rect().centerx-GRID_SIZE/2,
                        screen.get_rect().centery-GRID_SIZE/2,
                        GRID_SIZE,GRID_SIZE)
quadratoSchermo = screen.get_rect()
board = Board(problem,screen,quadratoCentrale,CELL_SIZE,N_GRID)
moves = PlanParse.extractPlan(problem)

for e in board.vehicles:
    print(e)

done = False
moveApplicate = 0 
finito = False

while not done:
    screen.fill(WHITE)
    clock.tick(2)

    if (not moves):
        board.showLabel("Unsolvable")
    
    board.drawVehicles()
    if finito: 
        board.showLabel("You win!")
    else:
        board.drawGoal()
    board.drawRed()
    GrigliaVuota(quadratoCentrale,N_GRID).drawGriglia(screen)



    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            done = True
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_UP:
                if (moveApplicate < len(moves)):
                    board.apply(moves[moveApplicate])
                else :
                    if (moves):
                        finito = True
                moveApplicate = moveApplicate+1
    pygame.display.update() 

pygame.quit()