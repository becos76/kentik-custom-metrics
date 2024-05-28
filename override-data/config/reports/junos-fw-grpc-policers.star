load("ranger", "source")
load("ranger", "metric")
load("ranger", "device")
load("ranger", "log")

metrics = [
    'offered-bytes',
    'offered-packets',
    'out-of-spec-bytes',
    'out-of-spec-packets',
    'transmitted-bytes',
    'transmitted-packets'
]

def execute(report):
    log("###### STLRK - POLICER START #######")
    data = source.select("junos/firewall")
    
    if data:
        # iterate over non empty dicts that have policer key
        for fname, state in  [
            (_.get('name'),
             _.get('state')
             ) for _ in data if _ and _['state'].get('policer')]:

            for policer in state['policer']:
                record = report.append()
                record.append("filter_name", fname)
                record.append("policer_name", policer.pop('name'))
                # Get metrics defined statically above
                for key in metrics:
                    record.append(key, policer.get(key) , metric=True)
                record.append("device_name", device().config.name)
                record.append("device_ip", device().config.host)
        log("###### STLRK - POLICER END #######")
    else:
        log("###### STLRK - POLICER *** EMPTY **** #######")
        
        
        
