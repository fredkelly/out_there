class OutThere.Models.Idea extends Backbone.Model
  paramRoot: 'idea'

  defaults:
    name: null
    summary: null

class OutThere.Collections.IdeasCollection extends Backbone.Collection
  model: OutThere.Models.Idea
  url: '/ideas'
