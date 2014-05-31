class OutThere.Models.Idea extends Backbone.Model
  paramRoot: 'idea'

  urlRoot: 'ideas'

  defaults:
    name: null
    summary: null
    score: null

class OutThere.Collections.IdeasCollection extends Backbone.Collection
  model: OutThere.Models.Idea
  url: '/ideas'
