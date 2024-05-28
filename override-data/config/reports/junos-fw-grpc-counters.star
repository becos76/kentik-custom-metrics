load("ranger", "source")
load("ranger", "metric")
load("ranger", "device")
load("ranger", "log")

def execute(report):
    log("###### STLRK - COUNTERS START #######")
    data = source.select("junos/firewall")
    
    if data:
        # iterate over non empty dicts that have counter key
        for fname, state in  [
            (_.get('name'),
             _.get('state')
             ) for _ in data if _ and _['state'].get('counter')] :

            for cname, packets, bytes in [
                (_.get('name') ,
                 _.get('packets'),
                 _.get('bytes')) for _ in state['counter'] ]:

                record = report.append()
                record.append("filter_name", fname)
                record.append("counter_name", cname)
                record.append("packets", packets, metric=True)
                record.append("bytes", bytes, metric=True)
                record.append("device_name", device().config.name)
                record.append("device_ip", device().config.host)

        log("###### STLRK - COUNTERS END #######")
    else:
        log("###### STLRK - COUNTERS *** EMPTY **** #######")
        
        
        
