source 'http://rubygems.org'

gem 'rails', '3.1.0'

gem 'sqlite3'
gem 'jquery-rails'


gem 'rabl'
gem 'require_relative'
gem 'htmlentities'
gem 'json'
gem 'bluecloth', '>= 2.0.5'
gem 'coderay', '~> 0.9'
gem 'kaminari'
gem 'RedCloth', '~> 4.2.8'
gem 'addressable', '~> 2.2.7', :require => 'addressable/uri'
gem 'mini_magick', '1.3.3', :require => 'mini_magick'
gem 'uuidtools', '~>2.1.1'
gem 'flickraw-cached'
gem 'rubypants', '~> 0.2.0'
gem 'rake', '>= 0.9.2' 
gem 'acts_as_list'
gem 'acts_as_tree_rails3'
gem 'recaptcha', :require => 'recaptcha/rails', :branch => 'rails3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
  gem 'therubyracer'
end

group :test, :development do
 # gem 'rspec-rails'
  gem 'ruby-debug19'
  gem 'factory_girl', '2.2.0'
  gem 'webrat'
  gem 'rspec-rails', '>= 2.0.0.beta.20'
  gem 'simplecov', :require => false
  gem 'sqlite3'
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels' # some pre-fabbed step definitions  
  gem 'database_cleaner' # to clear Cucumber's test database between runs
  gem 'capybara'         # lets Cucumber pretend to be a web browser
  gem 'launchy'          # a useful debugging aid for user stories
end

group :development do
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem "pickler", "~> 0.2.1"
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'cucumber-rails'
end
