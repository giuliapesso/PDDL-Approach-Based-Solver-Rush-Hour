import requests, sys

def solve(domain, problem):
    
        data = {'domain': open("../v3/rushHour_DomainXY.pddl", 'r').read(),
                'problem': open("../v3/Problems/rushHour_Problem4x4X.pddl", 'r').read()}

        resp = requests.post('http://solver.planning.domains/solve',
                        verify=False, json=data).json()

        with open("plan.ipc", 'w') as f:
        f.write('\n'.join([act['name'] for act in resp['result']['plan']]))