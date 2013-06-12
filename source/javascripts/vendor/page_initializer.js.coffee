template = _.template '''
  <li style="display: none"><p><%= paragraph %></p></li>
'''

$ ->
  source = new loremWhitman.Source
  fetchButton = $('.fetch')
  chunksContainer = $('.chunks')

  fetchButton.on 'click', ->
    source.fetchParagraphs().then (paragraphs) ->
      markup = _(paragraphs).map (p) ->
        template paragraph: p
      els = $(markup.join(''))
      chunksContainer.append els
      els.slideDown('fast')