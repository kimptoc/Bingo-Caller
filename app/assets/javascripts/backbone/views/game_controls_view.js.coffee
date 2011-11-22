class BingoCaller.GameControlsView extends Backbone.View
  template: JST["backbone/templates/game_controls_view"]
  el: '#game-controls'
  events: { 'click #next_ball': 'nextBall' }

  initialize: ->
    @render()

  nextBall: =>
    console.log("next ball time")
    @model.nextBall()

  render: =>
    console.log("model:",@model)
    $(@el).html(@template( @model.toJSON() ))
#   kick jqueryui styling into action - needed as we added button dynamically.
    $("#next_ball").button()
