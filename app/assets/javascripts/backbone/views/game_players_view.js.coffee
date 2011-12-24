class BingoCaller.GamePlayersView extends Backbone.View
  template: JST["backbone/templates/game_players_view"]
  el: '#game-player-maintenance'
  events:
    'click #game_add_player': 'gameAddPlayer'
    'click .game_update_player': 'gameUpdatePlayer'
    'click .game_delete_player': 'gameDeletePlayer'

  initialize: ->
    @options.players.bind('reset',@render)
    @options.game_players.bind('reset',@render)
    @options.game.bind('change',@render)

  gameUpdatePlayer: (clickedButton) ->
    clickedButton.preventDefault();
    currFormId = "##{$(clickedButton.target).attr('data_form_id')}"
    currId = $(clickedButton.target).attr('data_id')
    form_data = $(currFormId).serialize()
    console?.log "game Update Player", currFormId, currId, form_data
    $(clickedButton.currentTarget).button('disable')
    $.ajax("/games/#{@options.game.get 'game_id'}/player_games/#{currId}",
      type: "PUT",
      data: form_data,
      success: @handleSavedOk,
      dataType: "json").error(-> console?.log "oops upd error")

  gameDeletePlayer: (clickedButton) ->
    clickedButton.preventDefault();
    currFormId = "##{$(clickedButton.target).attr('data_form_id')}"
    currId = $(clickedButton.target).attr('data_id')
    console?.log "game Delete Player", currFormId, currId
    $(clickedButton.currentTarget).button('disable')
    form_data = $(currFormId).serialize()
    $.ajax("/games/#{@options.game.get 'game_id'}/player_games/#{currId}",
      type: "DELETE",
      data: form_data,
      success: @handleSavedOk,
      dataType: "json").error(-> console?.log "oops del error")

  gameAddPlayer: (clickedButton)->
    console?.log "game Add Player"
    clickedButton.preventDefault();
    $('#game_add_player').button('disable')
    form_data = $('#new_game_player').serialize()
    console?.log "add player data:", form_data
    $.post("/games/#{@options.game.get 'game_id'}/player_games", form_data, @handleSavedOk, "json").error(-> console?.log "oops add error")

  handleSavedOk: =>
    @options.players.fetch()
    @options.game_players.fetch()
    location.reload()

  render: =>
    console?.log "game players view:render", @options.game_players.toJSON()
    if @options.players.length == 0 and @options.game_players.length > 0
      console?.log "no players yet, ignore render"
      return
#    console?.log "render game player/model:",@options
    context =
      players: @options.players.toJSON()
      game_players: @options.game_players.toJSON()
      game: @options.game.toJSON()
#    console?.log "game player view context",context
#    console?.log @options.players.toJSON()
#    console?.log @options.game_players.toJSON()
    $(@el).html @template( context )
    $('#game_add_player').button()
    $('.game_update_player').button()
    $('.game_delete_player').button()

