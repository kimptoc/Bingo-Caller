class BingoCaller.Game extends Backbone.Model
  initialize: (options)->
    @set 'game_id': options['game_id']
    @url = "/games/#{options['game_id']}/status.json"
    @next_ball_url = "/games/#{options['game_id']}/next_ball.json"

  nextBall: =>
    console.log("Game.nextBall")
    jQuery.ajax(@next_ball_url, success: (=> @fetch()))

  handleWinnerLine: =>
     console.log("Game.line!")

  handleWinnerHouse: =>
    console.log("Game.house!")

  anotherGame: =>
    console.log("Game.another!")
    window.location = "/games/#{@get 'game_id'}/same_again"

#  urlRoot: 'games/game_id/status.json'

#  dofetch: ->
#    @set 'jstime': new Date()
#    @fetch()


