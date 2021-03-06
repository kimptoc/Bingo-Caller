class BingoCaller.GameRouter extends Backbone.Router
  initialize: (game_id, bingo_session_id)->
    console.log "init game router"
    @game_status = new BingoCaller.Game({game_id})
    @view = new BingoCaller.GameSummaryView(model: @game_status)
    @controls = new BingoCaller.GameControlsView(model: @game_status)
    @current_ball_view = new BingoCaller.GameLastBallView(model: @game_status)
    @last_few_balls_view = new BingoCaller.GameLastFewBallsView(model: @game_status)
    @ball_caller_view = new BingoCaller.GameBallCallerView(model: @game_status)
    @players_model = new BingoCaller.Players(bingo_session_id: bingo_session_id)
    @game_players_model = new BingoCaller.GamePlayers(game_id:game_id, players:@players_model)
    @game_players_view = new BingoCaller.GamePlayersView(players: @players_model, game_players: @game_players_model, game: @game_status)
    @game_status.fetch()
    @players_model.fetch()
    @game_players_model.fetch()
#    @game_status.fetch(success: => @view.render())
#    @status = new Ecom1.Models.Status
#    status.fetch(success: -> @view = new Ecom1.StatusView(model: status))
#    @view = new Ecom1.StatusView(model: @status)
#    setInterval((=> @status.dofetch()), 1500)
#    @status.fetch()
    @loop_started = false
    @game_status.bind('change',@model_changed)

  model_changed: =>
    setInterval( (=> @game_status.nextBall(manual_click: false)), 1000*@game_status.get("secs_between_calls")) unless @loop_started
    @loop_started = true

#  dofetch: ->
#    @status.dofetch()
