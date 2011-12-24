class BingoCaller.GameLastFewBallsView extends Backbone.View
  template: JST["backbone/templates/game_last_few_balls_view"]
  el: '#game-last-few-balls'

  initialize: ->
    @model.bind('change',@render)

  render: =>
#    console.log("render last few balls/model:",@model)
    $(@el).html(@template( @model.toJSON() ))
    $("#accordionTR").accordion()
