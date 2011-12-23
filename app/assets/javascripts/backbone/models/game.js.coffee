class BingoCaller.Game extends Backbone.Model
  initialize: (options)->
    @set 'game_id': options['game_id']
    @url = "/games/#{options['game_id']}/status.json"
    @next_ball_url = "/games/#{options['game_id']}/next_ball.json"
    @winner_line_url = "/games/#{options['game_id']}/record_winner_line.json"
    @winner_bingo_url = "/games/#{options['game_id']}/record_winner_bingo.json"
    @auto_toggle_url = "/games/#{options['game_id']}/auto_toggle.json"
    @bind('all', @resetPauseAuto)

#  fetch: ->
#    console?.log "game fetch called"
#    super()

  resetPauseAuto: ->
    console?.log "resetPauseAuto"
    BingoCaller.pause_auto = false

  autoToggle: ->
    $.get(@auto_toggle_url, success: ( => @fetch() )).error( -> console?.log "ajax error/autoToggle")

  nextBall: (options)=>
#    console?.log("Game.nextBall:auto:#{@get("auto_mode")}, cancel:#{BingoCaller.cancel_auto}, pause:#{BingoCaller.pause_auto}", this)
    #todo - fix this, should work in manual mode too
    if @get("auto_mode") == true and BingoCaller.cancel_auto == false and BingoCaller.pause_auto == false
      $.get(@next_ball_url, success: ( => @fetch() )).error( -> console?.log "ajax error/nextBall")
    else if options.manual_click == true
      $.get(@next_ball_url, success: ( => @fetch() )).error( -> console?.log "ajax error/nextBall/manual")

  handleWinnerLine: (player_id) =>
    console?.log("Game.line!",player_id)
    $.get(@winner_line_url,"player_with_first_line=#{player_id}", success: ( => @fetch() )).error( -> console?.log "ajax error/handleLine")
#    jQuery.ajax(@winner_line_url + "?player_with_first_line=#{player_id}", success: (=> @fetch()))

  handleWinnerHouse: (player_id) =>
    console?.log("Game.house!", player_id)
    $.get(@winner_bingo_url, "player_with_bingo=#{player_id}", success: ( => @fetch() )).error( -> console?.log "ajax error/handleBingo")
#    jQuery.ajax(@winner_bingo_url + "?player_with_bingo=#{player_id}", success: (=> @fetch()))

  anotherGame: =>
    console?.log("Game.another!")
    window.location = "/games/#{@get 'game_id'}/same_again"



