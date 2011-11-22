#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.BingoCaller =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

BingoCaller.cancel_auto = false

BingoCaller.start= (auto_mode, selected_tab, next_ball_url, secs_between_calls, game_id) ->
  $("#tabBottom").tabs()
  $("#tabBottom").tabs("select",0)
  $("#tabBottom").tabs("select",selected_tab) if selected_tab
  $("#accordionTL").accordion()
  $("#accordionTR").accordion()

  pElement = document.getElementById("audio");
  pElement.load();
  pElement.play();

  timer=setTimeout((-> BingoCaller.next_ball(next_ball_url)),1000*secs_between_calls) if auto_mode

  router = new BingoCaller.GameRouter(game_id)

BingoCaller.next_ball= (next_ball_url) ->
  return if (BingoCaller.cancel_auto)
  console.log("time for next ball")
  window.location = next_ball_url

BingoCaller.handleWinnerLine= (auto_mode, next_ball_url) ->
  BingoCaller.cancel_auto = true
  $( "#dialog-winner-line" ).dialog
    resizable: false
    height:140
    modal: true
    buttons:
      "Save winner": ->
        $( this ).dialog( "close" )
        document.form_winner_line.submit()
      Cancel: ->
        $( this ).dialog( "close" )
        window.location = next_ball_url if auto_mode

BingoCaller.handleWinnerHouse= (auto_mode, next_ball_url) ->
  BingoCaller.cancel_auto = true
  $( "#dialog-winner-house" ).dialog
    resizable: false
    height:140
    modal: true
    buttons:
      "Save winner": ->
        $( this ).dialog( "close" )
        document.form_winner_house.submit()
      Cancel: ->
        $( this ).dialog( "close" )
        window.location = next_ball_url if auto_mode

