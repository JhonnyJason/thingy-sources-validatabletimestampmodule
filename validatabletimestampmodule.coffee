validatabletimestampmodule = {name: "validatabletimestampmodule"}

############################################################
tfMS = 10000

############################################################
validatabletimestampmodule.setTimeFrameMS = (ms) -> tfMS = ms

############################################################
validatabletimestampmodule.assertValidity = (timestamp) ->
    now = Date.now()
    now_rounded = now - (now % tMS)

    if timestamp != now_rounded then now_rounded -= tMS
    else return
    if timestamp != now_rounded then now_rounded += 2 * tMS
    else return
    if timestamp != now_rounded then throw new Error("Invalid Timestamp!")
    else return
    return

############################################################
validatabletimestampmodule.create = ->
    now = Date.now()
    now_rounded = now - (now % tMS)
    return now_rounded

export default validatabletimestampmodule

