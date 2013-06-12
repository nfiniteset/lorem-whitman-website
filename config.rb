require 'whitman'
require 'lib/api'

DEFAULT_PARAGRAPH_COUNT = 1
SENTENCES_PER_PARAGRAPH = 2


map "/api" do  
  run API
end  


helpers do
  def paragraphs(count = DEFAULT_PARAGRAPH_COUNT)
    count.times.map {
      Whitman::Paragraph.paragraphs(SENTENCES_PER_PARAGRAPH).join(' ')
    }
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  # activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end