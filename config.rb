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

activate :patterns

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
  # set :typekit_id, 'xxxxxxx'
end

set :relative_links, true
set :haml, { :ugly => true, :format => :html5 }
set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

# Add bower's directory to sprockets asset path
after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

activate :directory_indexes

# Autoprefixer configuration
activate :autoprefixer do |config|
  config.browsers = ['last 2 versions', 'Explorer >= 9']
  config.cascade  = false
  config.inline   = true
  # config.ignore   = ['hacks.css']
end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
  # set :typekit_id, 'xxxxxxx'

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end

activate :imageoptim do |options|
  # Use a build manifest to prevent re-compressing images between builds
  options.manifest = true

  # Silence problematic image_optim workers
  options.skip_missing_workers = true

  # Cause image_optim to be in shouty-mode
  options.verbose = false

  # Setting these to true or nil will let options determine them (recommended)
  options.nice = true
  options.threads = true

  # Image extensions to attempt to compress
  options.image_extensions = %w(.png .jpg .gif .svg)

  # Compressor worker options, individual optimisers can be disabled by passing
  # false instead of a hash
  options.advpng    = { :level => 4 }
  options.gifsicle  = { :interlace => false }
  options.jpegoptim = { :strip => ['all'], :max_quality => 100 }
  options.jpegtran  = { :copy_chunks => false, :progressive => true, :jpegrescan => true }
  options.optipng   = { :level => 6, :interlace => false }
  options.pngcrush  = { :chunks => ['alla'], :fix => false, :brute => false }
  options.pngout    = { :copy_chunks => false, :strategy => 0 }
  options.svgo      = {}
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = 'gh-pages'
  deploy.build_before = true
  # deploy.deploy_method = :rsync
  # deploy.host          = 'www.example.com'
  # deploy.path          = '/srv/www/site'
  # Optional Settings
  # deploy.user  = 'tvaughan' # no default
  # deploy.port  = 5309 # ssh port, default: 22
  # deploy.clean = true # remove orphaned files on remote host, default: false
  # deploy.flags = '-rltgoDvzO --no-p --del' # add custom flags, default: -avz
end