class BingoCaller.GameBallCallerView extends Backbone.View
  template: JST["backbone/templates/game_ball_caller_view"]
  el: '#ball-caller'

  initialize: ->
    @model.bind('change',@render)

  render: =>
    console.log("render ball caller/model:",@model)
    $(@el).html(@template( @model.toJSON() ))
#    pElement = $("ball_caller_id")
#    pElement?.load()
#    pElement?.play()

