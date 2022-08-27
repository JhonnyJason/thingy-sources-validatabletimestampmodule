############################################################
tfMS = 10000

############################################################
export initialize = ->
    c = allModules.configmodule
    if c.validationTimeFrameMS then tfMS = c.validationTimeFrameMS
    return

############################################################
export setTimeFrameMS = (ms) -> tfMS = ms

############################################################
export assertValidity = (timestamp) ->
    now = Date.now()
    now_rounded = now - (now % tfMS)

    if timestamp != now_rounded then now_rounded -= tfMS
    else return
    if timestamp != now_rounded then now_rounded += 2 * tfMS
    else return
    if timestamp != now_rounded then throw new Error("Invalid Timestamp!")
    else return
    return

############################################################
export create = ->
    now = Date.now()
    now_rounded = now - (now % tfMS)
    return now_rounded