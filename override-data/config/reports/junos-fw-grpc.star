load("ranger", "source")
load("ranger", "metric")
load("ranger", "device")
load("ranger", "log")

def execute(report):
    log("###### STARTING STRALARK #######")
    
    data = source.select("junos/firewall")
    
    log(data)
    
    log("###### STRALARK FINISHED #######")
    



