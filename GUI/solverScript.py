import requests, sys

def solve(domain="./v3/rushHour_DomainXY.pddl", problem ="./v3/Problems/rushHour_Problem4x4X.pddl"):
        data = {'domain': open(domain, 'r').read(),
                        'problem': open(problem, 'r').read()}

        resp = requests.post('http://solver.planning.domains/solve',
                                verify=False, json=data).json()

        with open("plan.ipc", 'w') as f:
                f.write('\n'.join([act['name'] for act in resp['result']['plan']]))
        
        return f