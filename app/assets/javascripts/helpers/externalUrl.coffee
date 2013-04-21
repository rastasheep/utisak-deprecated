Ember.Handlebars.registerBoundHelper "externalUrl", (url) ->
  new Ember.Handlebars.SafeString "<a href='#{url}' target='_blank' class='external-link'>#{url}</a>"

