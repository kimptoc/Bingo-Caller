class BingoCaller.Game extends Backbone.Model
  initialize: (options)->
    @set 'game_id': options['game_id']
    @url = "/games/#{options['game_id']}/status.json"

#  urlRoot: 'games/game_id/status.json'

#  dofetch: ->
#    @set 'jstime': new Date()
#    @fetch()


