Vazno.Comment = DS.Model.extend
  content: DS.attr 'string'
  news: DS.belongsTo('Vazno.News')
