validatabletimestampmodule = {name: "validatabletimestampmodule"}

############################################################
tfMS = 10000

############################################################
validatabletimestampmodule.setTimeFrameMS = (ms) -> tfMS = ms

############################################################
validatabletimestampmodule.assertValidity = (timestamp) ->
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
validatabletimestampmodule.create = ->
    now = Date.now()
    now_rounded = now - (now % tfMS)
    return now_rounded

export default validatabletimestampmodule

