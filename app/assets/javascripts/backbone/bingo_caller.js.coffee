#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

$('body').ajaxError( -> console.log "uh-oh, ajax error" )

window.BingoCaller =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

BingoCaller.cancel_auto = false
BingoCaller.pause_auto = false

BingoCaller.is_selected= (db_value, test_value) ->
#  console?.log "is_selected?",db_value, test_value, db_value == test_value
  if db_value == test_value
    "selected"
  else
    ""

BingoCaller.start= (auto_mode, selected_tab, next_ball_url, secs_between_calls, game_id, bingo_session_id) ->
  $("#tabBottom").tabs()
  $("#tabBottom").tabs("select",0)
  $("#tabBottom").tabs("select",selected_tab) if selected_tab

 # timer=setTimeout((-> BingoCaller.next_ball(next_ball_url)),1000*secs_between_calls) if auto_mode

  router = new BingoCaller.GameRouter(game_id, bingo_session_id)

