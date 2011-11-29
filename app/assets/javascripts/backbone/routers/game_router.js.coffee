class BingoCaller.GameRouter extends Backbone.Router
  initialize: (game_id)->
    console.log "init game router"
    @game_status = new BingoCaller.Game({game_id})
    @view = new BingoCaller.GameSummaryView(model: @game_status)
    @controls = new BingoCaller.GameControlsView(model: @game_status)
    @current_ball_view = new BingoCaller.GameLastBallView(model: @game_status)
    @last_few_balls_view = new BingoCaller.GameLastFewBallsView(model: @game_status)
    @game_status.fetch()
#    @game_status.fetch(success: => @view.render())
#    @status = new Ecom1.Models.Status
#    status.fetch(success: -> @view = new Ecom1.StatusView(model: status))
#    @view = new Ecom1.StatusView(model: @status)
#    setInterval((=> @status.dofetch()), 1500)
#    @status.fetch()
    @loop_started = false
    @game_status.bind('change',@model_change)

  model_change: =>
    setInterval( (=> @game_status.nextBall()), 1000*@game_status.get("secs_between_calls")) unless @loop_started
    @loop_started = true

#  dofetch: ->
#    @status.dofetch()
