class BingoCaller.Game extends Backbone.Model
  initialize: (options)->
    @set 'game_id': options['game_id']
    @url = "/games/#{options['game_id']}/status.json"
    @next_ball_url = "/games/#{options['game_id']}/next_ball.json"
    @winner_line_url = "/games/#{options['game_id']}/record_winner_line.json"
    @winner_bingo_url = "/games/#{options['game_id']}/record_winner_bingo.json"
    @auto_toggle_url = "/games/#{options['game_id']}/auto_toggle.json"
    @bind('change', @resetPauseAuto)

  resetPauseAuto: ->
    BingoCaller.pause_auto = false

  autoToggle: ->
    jQuery.ajax(@auto_toggle_url, success: (=> @fetch()))

  nextBall: =>
    console.log("Game.nextBall:auto:#{@get("auto_mode")}, cancel:#{BingoCaller.cancel_auto}, pause:#{BingoCaller.pause_auto}", this)
    jQuery.ajax(@next_ball_url, success: (=> @fetch())) if @get("auto_mode") == true and BingoCaller.cancel_auto == false and BingoCaller.pause_auto == false

  handleWinnerLine: (player_id) =>
    console.log("Game.line!",player_id)
    jQuery.ajax(@winner_line_url + "?player_with_first_line=#{player_id}", success: (=> @fetch()))

  handleWinnerHouse: (player_id) =>
    console.log("Game.house!", player_id)
    jQuery.ajax(@winner_bingo_url + "?player_with_bingo=#{player_id}", success: (=> @fetch()))

  anotherGame: =>
    console.log("Game.another!")
    window.location = "/games/#{@get 'game_id'}/same_again"


#  urlRoot: 'games/game_id/status.json'

#  dofetch: ->
#    @set 'jstime': new Date()
#    @fetch()


