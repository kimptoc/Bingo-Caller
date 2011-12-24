class BingoCaller.GameControlsView extends Backbone.View
  template: JST["backbone/templates/game_controls_view"]
  el: '#game-controls'
  events:
    'click #next_ball': 'nextBall'
    'click #btn_auto' : 'autoOn'
    'click #btn_pause': 'autoOff'

  initialize: ->
    @model.bind('change',@render)

  nextBall: =>
    console.log("next ball time")
    $("#next_ball").button('disable')
    @model.nextBall(manual_click: true)

  autoOn: =>
    console.log "autoOn:current setting:#{@model.get("auto_mode")}"
    $("#btn_auto").button('disable')
    BingoCaller.pause_auto = true
    @model.autoToggle() if @model.get("auto_mode") == false


  autoOff: =>
    console.log "autoOff:current setting:#{@model.get("auto_mode")}"
    $("#btn_pause").button('disable')
    BingoCaller.pause_auto = true
    @model.autoToggle() if @model.get("auto_mode") == true

  render: =>
#    console.log("rendering controls view:",@model)
    $(@el).html(@template( @model.toJSON() ))
#   kick jqueryui styling into action - needed as we added button dynamically.
    $("#next_ball").button()
    $("#btn_auto").button()
    $("#btn_pause").button()
#    console.log "auto_mode = #{@model.get("auto_mode")}"
    if @model.get("auto_mode") is false
#      console.log "auto mode is off"
      btn_auto_enable = 'enable'
      btn_pause_enable = 'disable'
    else
#      console.log "auto mode is on"
      btn_auto_enable = 'disable'
      btn_pause_enable = 'enable'
    $("#btn_auto").button(btn_auto_enable)
    $("#btn_pause").button(btn_pause_enable)
