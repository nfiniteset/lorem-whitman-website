require 'whitman'
require 'lib/api'

map "/api" do  
  run API
end  

helpers do
  def paragraphs(count = 1)
    Whitman::Paragraph.paragraphs(count)
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Enable cross-origin access to the api
use Rack::Cors do
  allow do
    origins '*'
    resource '/api/*', :headers => :any, :methods => :get
  end
end