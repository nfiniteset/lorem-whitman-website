The API
-------

Lorem Whitman provides a JSON API you can use to generate multituds of Whitman.

Data returned by the API looks like this:


    {
      whitman: [
        'By the cot in the hospital...',
        'Twenty-eight years of womanly life...',
        'Stop this day and night with me...'
      ]
    } 


### Example

Append 3 paragraphs of Lorem Whitman to the page using jQuery:

    url = 'http://loremwhitman.com/api/paragraphs/3'
    $.getJSON(url).then (data) ->
      $.each data.whitman, (i, paragraph) ->
        $('body').append "<p>#{paragraph}</p>"

### Methods

#### Paragraphs

`GET http://loremwhitman.com/api/paragraphs/:count`

Returns a number of paragraphs.


#### Sentences

`GET http://loremwhitman.com/api/sentences/:count`

Returns a number of sentences.


