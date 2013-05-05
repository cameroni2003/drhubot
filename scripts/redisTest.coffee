#   Display a random tweet from twitter about a subject
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot <keyword> tweet - Returns a link to a tweet about <keyword>
#
# Author:
#   atmos

module.exports = (robot) ->
  robot.respond /save this (\w+) (\w+)/i, (msg) ->
    key = msg.match[1]
    val = msg.match[2]

    saveObj = robot.brain.get 'tempSave'
    if not saveObj
      saveObj = {}
    saveObj[key] = val
    msg.send "Key: #{key} | Value: #{val}"

  robot.respond /show this (\w+)/i, (msg) ->
    key = msg.match[1]

    saveObj = robot.brain.get 'tempSave'
    if not saveObj?[key]
      msg.send "didn't find anything"
    else
      msg.send "Found: #{saveObj[key]}"


