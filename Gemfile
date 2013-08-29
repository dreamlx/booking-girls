require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'http://ruby.taobao.org'

gem 'rails', '3.2.12'
gem 'devise'
gem "nested_form"
gem 'state_machine'
gem 'simple_form'
gem 'activeadmin'
gem 'state_machine'
gem 'awesome_nested_set'
gem 'useragent'
gem 'gon'
gem 'by_star', :git => "git://github.com/radar/by_star"
gem 'carrierwave-qiniu'
#i18n
gem 'rails-i18n'
gem 'devise-i18n-views'
gem 'qiniu-rs'
#paginate
gem 'bootstrap-will_paginate', :git => 'git://github.com/yrgoldteeth/bootstrap-will_paginate.git'
#gem 'kaminari' 

gem "fog", "~> 1.3.1"
gem "cancan"
gem "acts_as_rateable", :git => "git://github.com/anton-zaytsev/acts_as_rateable.git"
gem 'acts_as_commentable', '3.0.1'
gem 'jquery-rails'
gem 'fancybox2-rails', '~> 0.2.4'
gem 'haml'
gem 'carrierwave'
gem 'rmagick'
gem 'rack-livereload'

gem 'default_value_for', '~> 2.0.1'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass'
  gem 'font-awesome-sass-rails', '~> 3.0.2.2'
  gem 'fancybox2-rails', '~> 0.2.4'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem "therubyracer", :require => 'v8'
  gem 'uglifier', '>= 1.0.3'
end

case HOST_OS
  when /darwin/i
    gem 'growl', :group => :development
    gem 'terminal-notifier-guard'
    gem 'guard-pow', :group => :development
  when /linux/i
    gem 'libnotify', :group => :development
    gem 'rb-inotify', :group => :development
  when /mswin|windows/i
   gem 'rb-fchange', :group => :development
  gem 'win32console', :group => :development
 gem 'rb-notifu', :group => :development
end

group :development, :test do
  gem 'pg'
  gem 'rspec-rails'
  gem 'spork'
  gem "guard-spork", :github => 'guard/guard-spork'
  gem 'rb-fsevent', :require => false, :group => :development if HOST_OS =~ /darwin/i
  gem "guard-rspec"
  gem 'guard-livereload'
  gem "capybara",">= 1.1.1"

  gem 'awesome_print', '~> 1.1.0'
  gem 'letter_opener', '~> 1.1.0'
  gem 'better_errors', '~> 0.7.0'
  gem 'binding_of_caller', '~> 0.7.1'

  gem 'factory_girl_rails' , "~> 1.1.0" ,:require => false
  gem 'database_cleaner', ">= 0.6.7"
  gem "launchy", ">= 2.0.5"
  gem "erb2haml"
end

group :development do
  #display all info, important
  gem 'mysql2'
  gem 'rails-footnotes', '>= 3.7.9'
  gem 'pry-rails'

  gem 'quiet_assets', '~> 1.0.1'

  gem "rvm-capistrano"
  gem 'capistrano', '~> 2.12.0'
  gem 'capistrano-ext' # Multistage Extension
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false

  #gem 'webrat' #web自动测试用于ruby
  gem 'guard-bundler'
end

group :production do
  gem 'mysql2'
  gem 'thin'
end

