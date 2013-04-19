Ember.Handlebars.registerBoundHelper "externalLink", (url) ->
  new Ember.Handlebars.SafeString "<a href=\"#{url}\" class=\"detail-disclosure\">"

Ember.Handlebars.registerBoundHelper "externalLinkEnd", () ->
  new Ember.Handlebars.SafeString "</a>"
