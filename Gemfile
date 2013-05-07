#require 'rbconfig'
#HOST_OS = RbConfig::CONFIG['host_os']
source 'http://ruby.taobao.org'
gem 'state_machine'
gem 'rails', '3.2.12'
gem 'devise'
gem "nested_form"
gem 'capistrano', '~> 2.12.0'
gem 'activeadmin'
gem 'erb2haml'
gem 'simple_form', '~> 2.1.0'
gem 'useragent'
#i18n
gem 'rails-i18n'
gem 'devise-i18n-views'


#gem 'kaminari' #paginate

gem "fog", "~> 1.3.1"
gem 'pg'
gem "cancan"
gem "acts_as_rateable", :git => "git://github.com/anton-zaytsev/acts_as_rateable.git"
gem 'acts_as_commentable', '3.0.1'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass'
  gem 'font-awesome-sass-rails', '~> 3.0.2.2'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  #gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'haml'

gem 'carrierwave'
gem 'bootstrap-will_paginate', :git => 'git://github.com/yrgoldteeth/bootstrap-will_paginate.git'
gem 'rmagick'
gem "heroku"
gem 'rack-livereload'
gem 'guard-livereload'
gem 'awesome_nested_set'
#if HOST_OS =~ /linux/i
#  gem 'therubyracer', '>= 0.8.2'
#end

#case HOST_OS
#  when /darwin/i
#    gem 'rb-fsevent', :group => :development
#    gem 'growl', :group => :development
#    gem 'guard-pow', :group => :development
#  when /linux/i
#    gem 'libnotify', :group => :development
#    gem 'rb-inotify', :group => :development
#  when /mswin|windows/i
#   gem 'rb-fchange', :group => :development
#  gem 'win32console', :group => :development
# gem 'rb-notifu', :group => :development
#end

group :development do
  gem "guard-rspec"
  #gem "guard"
  gem "rspec-rails"
  gem "capybara",">= 1.1.1"
  gem 'rails-footnotes', '>= 3.7.5.rc4'
  gem 'pry-rails'
  gem 'quiet_assets', '~> 1.0.1'
  gem 'awesome_print', '~> 1.1.0'
  gem 'letter_opener', '~> 1.1.0'
  gem 'better_errors', '~> 0.7.0'
  gem 'binding_of_caller', '~> 0.7.1'
  #gem 'rb-fsevent'
  #gem 'growl'
  #gem 'guard-pow'
end

group :test do
  # Pretty printed test output
  gem "rspec-rails"
  gem 'turn', :require => false
  gem 'factory_girl_rails' , "~> 1.1.0" ,:require => false
  gem 'database_cleaner', ">= 0.6.7"
  #gem 'mongoid-rspec', ">= 1.4.4"
  gem "capybara",">= 1.1.1"
  gem "launchy", ">= 2.0.5"
  #gem 'webrat' #web自动测试用于ruby
  gem "guard-rspec"
  gem "guard-spork", :github => 'guard/guard-spork'
  gem "spork"
  gem 'guard-bundler'
  gem 'rb-fsevent',  :require => false
  gem 'growl'
end

group :production do
  gem 'thin'
end
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
