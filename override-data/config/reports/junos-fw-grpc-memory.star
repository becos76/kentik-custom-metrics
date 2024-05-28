load("ranger", "source")
load("ranger", "metric")
load("ranger", "device")
load("ranger", "log")

def execute(report):
    log("###### STLRK - MEMORY START #######")
    data = source.select("junos/firewall")
    
    if data:
        # iterate over non empty dicts in the list
        for name, memory in  [
            (_.get('name'),
             _['state']['memory-usage'][0]['allocated']
             ) for _ in data if _]:
            record = report.append()
            record.append("filter_name", name)
            record.append("allocated_memory", memory, metric=True)
            record.append("device_name", device().config.name)
            record.append("device_ip", device().config.host)
        log("###### STLRK - MEMORY END #######")
    else:
        log("###### STLRK - MEMORY *** EMPTY **** #######")