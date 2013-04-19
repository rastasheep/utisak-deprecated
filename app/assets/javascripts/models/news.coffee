Vazno.News = DS.Model.extend
  title: DS.attr 'string'
  url: DS.attr 'string'
  domain: DS.attr 'string'
  points: DS.attr 'number', {defaultValue: 0}
