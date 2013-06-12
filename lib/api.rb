require 'sinatra'
require 'sinatra/json'
require 'whitman'

class API < Sinatra::Base
  helpers Sinatra::JSON

  get '/' do
    json whitman: paragraphs(1)
  end

  get '/paragraphs/:count' do
    json whitman: paragraphs(params[:count])
  end

  get '/sentences/:count' do
    json whitman: sentences(params[:count])
  end

  private

  def paragraphs(count = 1)
    Whitman::Paragraph.paragraphs(count.to_i)
  end

  def sentences(count = 1)
    Whitman::Sentence.sentences(count.to_i)
  end
end