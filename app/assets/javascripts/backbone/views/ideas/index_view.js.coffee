OutThere.Views.Ideas ||= {}

class OutThere.Views.Ideas.IndexView extends Backbone.View
  template: JST["backbone/templates/ideas/index"]

  initialize: () ->
    @options.ideas.bind('reset', @addAll)

  addAll: () =>
    @options.ideas.each(@addOne)

  addOne: (idea) =>
    view = new OutThere.Views.Ideas.IdeaView({model : idea})
    @$("#ideas-list").append(view.render().el)

  render: =>
    $(@el).html(@template(ideas: @options.ideas.toJSON() ))
    @addAll()

    return this
