class BingoCaller.Player extends Backbone.Model
  initialize: (options)->
    console?.log "player options", options
#    @set 'game_id': options['game_id']
    @urlRoot = "bingo_sessions/#{options['bingo_session_id']}/players/"

class BingoCaller.Players extends Backbone.Collection
  model: BingoCaller.Player
  initialize: (options)->
    console?.log "players options", options
#    @set 'game_id': options['game_id']
    @url = "/bingo_sessions/#{options['bingo_session_id']}/players/"

#  urlRoot: 'games/game_id/status.json'

#  dofetch: ->
#    @set 'jstime': new Date()
#    @fetch()


