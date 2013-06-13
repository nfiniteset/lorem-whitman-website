template = _.template '''
  <li class="hidden"><p><%= paragraph %></p></li>
'''

prompts = [
  'Not yet satisfied?',
  'Thirst unslaked?',
  'Not yet content?',
  'Got a hankering?',
  'Not yet soothed?',
  'Hungering?',
]

source = fetchButton = samples = fetchPrompt = undefined

$ ->
  source = new loremWhitman.Source
  fetchButton = $('.fetch')
  fetchPrompt = $('.prompt')
  samples = $('.samples')

  fetchButton.on 'click', (event) ->
    source.fetchParagraphs().then (paragraphs) ->
      appendSample(paragraphs)
      replacePrompt()
    event.preventDefault()

  $('h1').click ->
    window.location = '/'



appendSample = (paragraphs) ->
  markup = _(paragraphs).map (p) ->
    template paragraph: p
  els = $(markup.join(''))

  samples.append els
  setTimeout (-> els.removeClass('hidden')), 0
      
replacePrompt = ->
  fetchPrompt.text(randomPrompt())

randomPrompt = ->
  randomIndex = Math.floor(Math.random()*prompts.length)
  prompts[randomIndex]