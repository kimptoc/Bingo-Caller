class BingoCaller.GameLastBallView extends Backbone.View
  template: JST["backbone/templates/game_last_ball_view"]
  el: '#game-last-ball'

  initialize: ->
    @model.bind('change',@render)

  render: =>
    console.log("render last ball/model:",@model)
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
    console.log("handle winner line/view")
    BingoCaller.cancel_auto = true
    line_dialog = $( "#dialog-winner-line" )
    line_dialog.dialog
      resizable: false
      height:180
      modal: true
      buttons:
        "Save winner": =>
          line_dialog.dialog( "close" )
          @model.handleWinnerLine($("#game_player_with_first_line").val())
#          document.form_winner_line.submit()
          BingoCaller.cancel_auto = false
        Cancel: ->
          line_dialog.dialog( "close" )
          BingoCaller.cancel_auto = false


  handleWinnerHouse: =>
    console.log("handle winner house/view")
    BingoCaller.cancel_auto = true
    house_dialog = $( "#dialog-winner-house" )
    house_dialog.dialog
      resizable: false
      height:180
      modal: true
      buttons:
        "Save winner": =>
          house_dialog.dialog( "close" )
          @model.handleWinnerHouse($("#game_player_with_bingo").val())
#          document.form_winner_house.submit()
          BingoCaller.cancel_auto = false
        Cancel: ->
          $( this ).dialog( "close" )
          BingoCaller.cancel_auto = false

  anotherGame: =>
    @model.anotherGame()


#    <!--< % if (!player_with_first_line_id) { %>-->
#      <!--<span class="game_controls"><button onclick="BingoCaller.handleWinnerLine(< %= caller_session['auto'].present? %>,'< %= url_for :action => :next_ball %>');">Line?</button></span>-->
#    <!--< % } else if (!player_with_bingo_id) { %>-->
#      <!--<span class="game_controls"><button onclick="BingoCaller.handleWinnerHouse(< %= caller_session['auto'].present? %>,'< %= url_for :action => :next_ball %>');">House?</button></span>-->
#    <!--< % } else { %>-->
#      <!--<span class="game_controls">< %= link_to 'Another?',:action => :same_again %></span>-->
#    <!--< % }; %>-->
