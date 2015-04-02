require 'rack/google-analytics'

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

###
# Google Analytics
###
use Rack::GoogleAnalytics, :tracker => 'UA-51688410-1'

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# use pretty URLs (needs to be above the proxy to work properly)
activate :directory_indexes

%w(about_us clients technologies contact_us).each do |name|
  proxy "/#{name}.html", '/index.html'
end

activate :cdn do |cdn|
  cdn.cloudfront = {
      access_key_id: ENV['AWS_ACCESS_KEY_ID'] || 'AKIAI74B6TIUKUYQDEOQ',
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] || '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',
      distribution_id: 'E3SGK3O1XI3SL0'
  }

  #cdn.filter= /\.html/i     #default /.*/
  cdn.after_build = true
end

# Build-specific configuration
configure :build do
  activate :i18n

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  ignore 'images/icons/*'

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
