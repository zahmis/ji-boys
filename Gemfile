source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails',                   '~> 5.2.3'
gem 'bcrypt',                  '3.1.12'
gem 'faker',                   '1.7.3'
gem 'will_paginate',           '3.1.7'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass',          '3.4.1'
gem 'puma',                    '~> 3.12.6'
gem 'sass-rails',              '~> 5.0'
gem 'uglifier',                '>= 1.3.0'
# gem 'mini_racer', platforms: :ruby
gem 'coffee-rails',            '~> 4.2'
gem 'jquery-rails',            '4.3.1'
gem 'turbolinks',              '~> 5'
gem 'jbuilder',                '~> 2.5'
# gem 'redis',                 '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'capistrano-rails', group: :development
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rails-i18n'
#gem 'webpacker', github: 'rails/webpacker'
gem 'carrierwave'
gem 'mini_magick',           '~> 4.8'
gem 'mime-types'
gem 'dotenv-rails'
gem 'aws-ses',               '~> 0.6'
gem 'impressionist'


group :development, :test do
  gem 'mysql2', '0.5.3'
  gem 'byebug', '9.0.6',platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'solargraph'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest',                 '5.10.3'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production, :staging do
  gem 'unicorn'
end

group :production do
  gem 'mysql2', '0.5.3'
  gem 'fog-aws', '2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
