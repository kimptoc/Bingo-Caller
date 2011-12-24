class BingoCaller.GamePlayer extends Backbone.Model
  initialize: (options)->
#    console?.log "game player options", options
#    @options = options
#    @set 'game_id': options['game_id']
    @urlRoot = "games/#{options['game_id']}/player_games/"

  toJSON: ->
    json = super()
    player_id = @get("player_id")
#    console?.log "player_id:#{player_id}"
    player = @collection.players().get(player_id)
#    console?.log "player:",player
    if player
      json["player"]=player.toJSON()
    else
      json["player"]={name:"n/a"}
    json


#  urlRoot: 'games/game_id/status.json'

#  dofetch: ->
#    @set 'jstime': new Date()
#    @fetch()

class BingoCaller.GamePlayers extends Backbone.Collection
  model: BingoCaller.GamePlayer
  initialize: (options)->
#    super(options)
    @options = options
#    console?.log "game players options", options
#    @players = options.players
#    @game = options.game
#    @set 'game_id': options['game_id']
    @url = "/games/#{options['game_id']}/player_games/"

  players: ->
    @options.players

