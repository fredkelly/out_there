OutThere.Views.Ideas ||= {}

class OutThere.Views.Ideas.ShowView extends Backbone.View
  template: JST["backbone/templates/ideas/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
