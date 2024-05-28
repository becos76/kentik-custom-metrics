load("ranger", "source")
load("ranger", "metric")
load("ranger", "device")
load("ranger", "log")

def execute(report):
    log("###### STARTING STRALARK XRV #######")
    
    #data = source.select("/flow-spec/vrfs/vrf/afs/af/flows/flow")
    data = source.select("flow-spec/vrfs/vrf")
    
    
    
    for vrf_name, af_name, flow, statistics in [(
            i.get('vrf-name'), 
            y.get('af-name'), 
            z.get('flow-notation'), 
            z.get("flow-statistics") 
        ) for i in data for y in i['afs']['af'] for z in y['flows']['flow'] ]:
        if vrf_name == "":
            vrf_name = "default"
        record = report.append()
        record.append("vrf_name", vrf_name)
        record.append("af_name", af_name)
        record.append("flow_rule", flow)
        record.append(
            "classified_bytes", statistics['classified'].get('bytes'),
            metric=True)
        record.append(
            "classified_packets", statistics['classified'].get('packets'),
            metric=True)
        record.append(
            "dropped_bytes", statistics['dropped'].get('bytes'), metric=True)
        record.append(
            "dropped_packets", statistics['dropped'].get('packets'), metric=True)
        
        record.append("device_name", device().config.name)
        record.append("device_ip", device().config.host)
        
        # mydict = {}
        # mydict.update(
        #     { "vrf_name": vrf_name },
        #     { "af_name": af_name },
        #     { "flow_rule": flow },
        #     { "classified_bytes": statistics['classified'].get('bytes') },
        #     { "classified_packets": statistics['classified'].get('packets') },
        #     { "dropped_bytes": statistics['dropped'].get('bytes') },
        #     { "dropped_packets": statistics['dropped'].get('packets') },
        #     )
        # log(mydict)

    
    
    
    
    
    #log(data)
    
    #log(type(data))
    
    log("###### STRALARK XRV FINISHED #######")
    

