class window.loremWhitman.Source

  fetchParagraphs: (count = 1) ->
    $.getJSON("/api/paragraphs/#{count}").then (data) ->
      data.whitman
