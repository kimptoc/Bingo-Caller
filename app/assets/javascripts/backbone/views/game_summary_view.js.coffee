class BingoCaller.GameSummaryView extends Backbone.View
  template: JST["backbone/templates/game_summary_view"]
  el: '#game-summary'

  initialize: ->
    @model.bind('change',@render)
    @model.bind('reset',@render)
#    App.favorites.bind('add', this.renderItem, this)
#    App.favorites.bind('reset', this.render, this)

  render: =>
    console.log "render summary/model:",@model
    $(@el).html @template( @model.toJSON() )
    console.log "model.called_balls:",@model.get('called_balls')
    for called_ball in @model.get('called_balls')
      $("#game-ball-#{called_ball}").removeClass("ball_not_called").addClass("ball_called")
