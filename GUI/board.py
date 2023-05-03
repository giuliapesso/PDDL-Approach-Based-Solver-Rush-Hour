from vehicle import Vehicle
import ProblemParse
class Board:

    
    grid = [] 
    vehicles = []
        
    
    def __init__(self,problem):
        self.vehicles = ProblemParse.drawVehicle(problem)

    