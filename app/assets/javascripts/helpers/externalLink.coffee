Ember.Handlebars.registerBoundHelper "externalLink", (url,title) ->
    new Ember.Handlebars.SafeString "<a href=\"#{url}\">#{title}</a>"
