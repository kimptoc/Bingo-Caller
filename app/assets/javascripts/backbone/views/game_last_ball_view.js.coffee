class BingoCaller.GameLastBallView extends Backbone.View
  template: JST["backbone/templates/game_last_ball_view"]
  el: '#game-last-ball'

  initialize: ->
    @model.bind('change',@render)

  render: =>
    console.log("last ball/model:",@model)
    $(@el).html(@template( @model.toJSON() ))
    $("#accordionTL").accordion()
    action_button = $("#action-button")
    if ! @model.get "player_with_first_line_id"
      action_button.text("Line?")
      action_button.click @handleWinnerLine
    else if ! @model.get "player_with_bingo_id"
      action_button.text("House?")
      action_button.click @handleWinnerHouse
    else
      action_button.text("Another?")
      action_button.click @anotherGame
    action_button.button()

  handleWinnerLine: =>
    @model.handleWinnerLine()

  handleWinnerHouse: =>
    @model.handleWinnerHouse()

  anotherGame: =>
    @model.anotherGame()


#    <!--< % if (!player_with_first_line_id) { %>-->
#      <!--<span class="game_controls"><button onclick="BingoCaller.handleWinnerLine(< %= caller_session['auto'].present? %>,'< %= url_for :action => :next_ball %>');">Line?</button></span>-->
#    <!--< % } else if (!player_with_bingo_id) { %>-->
#      <!--<span class="game_controls"><button onclick="BingoCaller.handleWinnerHouse(< %= caller_session['auto'].present? %>,'< %= url_for :action => :next_ball %>');">House?</button></span>-->
#    <!--< % } else { %>-->
#      <!--<span class="game_controls">< %= link_to 'Another?',:action => :same_again %></span>-->
#    <!--< % }; %>-->
