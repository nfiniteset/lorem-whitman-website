template = _.template '''
  <li style="display: none"><p><%= paragraph %></p></li>
'''

$ ->
  source = new loremWhitman.Source
  fetchButton = $('.fetch')
  samples = $('.samples')

  fetchButton.on 'click', (event) ->
    event.preventDefault()

    source.fetchParagraphs().then (paragraphs) ->
      markup = _(paragraphs).map (p) ->
        template paragraph: p
      els = $(markup.join(''))

      samples.append els
      els.slideDown('fast')