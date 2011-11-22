class BingoCaller.GameControlsView extends Backbone.View
  events: { 'click #next_ball': 'nextBall' }

  nextBall: =>
    alert("next ball time")