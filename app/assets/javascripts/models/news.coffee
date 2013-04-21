Vazno.News = DS.Model.extend
  title: DS.attr 'string'
  url: DS.attr 'string'
  domain: DS.attr 'string'
  author: DS.attr 'string'
  points: DS.attr 'number', {defaultValue: 0}
  can_vote: DS.attr 'boolean'
  created_at: DS.attr 'date'
  comments: DS.hasMany('Vazno.Comment', {key: 'comment_ids'} )
