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
  robot.respond /bitcoin (\w+)/i, (msg) ->
    cur = msg.match[1].toUpperCase()
    msg.http('http://api.bitcoincharts.com/v1/weighted_prices.json')
      .get() (err, res, body) ->
        json = JSON.parse(body)
        if json[cur]
          msg.send "BTC: #{cur}$#{json[cur]['24h']}"
        else
          msg.send "Didn't find your currency."

