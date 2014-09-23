# Description:
#   get RandomPic from tiqav.com
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot tiq me - fetch a random picture from tiqav
#   hubot tiq get Query - search image from tiqav using word

module.exports = (robot) ->

  robot.respond /tiq me/i, (msg) ->
    msg.http("http://api.tiqav.com/search/random.json")
      .get() (err, res, body) ->
        arr = JSON.parse(body)
        rand = Math.floor(Math.random() * (arr.length + 1))
        msg.send "http://img.tiqav.com/#{arr[rand].id}.#{arr[rand].ext}"


  robot.respond /tiq get (.*)$/i, (msg) ->
     msg.http("http://api.tiqav.com/search.json?q=#{msg.match[1]}")
      .get() (err, res, body) ->
        arr = JSON.parse(body)
        msg.send "http://img.tiqav.com/#{arr[0].id}.#{arr[0].ext}"
