class BingoCaller.GameLastBallView extends Backbone.View
  template: JST["backbone/templates/game_last_ball_view"]
  el: '#game-last-ball'

  initialize: ->
    @model.bind('change',@render)
    @model.bind('reset',@render)

  render: =>
    console?.log("render last ball/model:",@model)
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
    @handleWinner "#dialog-winner-line", "#game_player_with_first_line", @model.handleWinnerLine

  handleWinnerHouse: =>
    @handleWinner "#dialog-winner-house", "#game_player_with_bingo", @model.handleWinnerHouse

  handleWinner: (dialog_id, result_id, model_func) =>
    console?.log("handle winner house or line/view")
    BingoCaller.cancel_auto = true
    $("#action-button").button('disable')
    house_dialog = $( dialog_id )
    house_dialog.dialog
      resizable: false
      height:180
      modal: true
      buttons:
        "Save winner": =>
          house_dialog.dialog "close"
          model_func $(result_id).val()
          BingoCaller.cancel_auto = false
        Cancel: ->
          $( this ).dialog( "close" )
          $("#action-button").button('enable')
          BingoCaller.cancel_auto = false

  anotherGame: =>
    $("#action-button").button('disable')
    @model.anotherGame()

