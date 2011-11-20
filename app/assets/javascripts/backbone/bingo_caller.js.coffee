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

BingoCaller.next_ball= (next_ball_url) ->
  return if (cancel_auto)
  window.location = next_ball_url


