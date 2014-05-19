OutThere.Views.Ideas ||= {}

class OutThere.Views.Ideas.IdeaView extends Backbone.View
  template: JST["backbone/templates/ideas/idea"]

  events:
    "click .destroy" : "destroy"

  tagName: "li"

  className: "idea"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
