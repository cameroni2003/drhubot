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
	robot.respond /bitcoin/i, (msg) ->
		msg.http('http://api.bitcoincharts.com/v1/weighted_prices.json')
			.get() (err, res, body) ->
				json = JSON.parse(body)

				msg.send 'BTC: USD$#{json.USD.24h}'
