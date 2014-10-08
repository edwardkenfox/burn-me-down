source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'

# template engine
gem 'haml-rails'
gem 'kaminari'
gem 'erb2haml'

# databse
gem 'mysql2'

# css
gem 'sass-rails', '~> 4.0.3'
gem 'font-awesome-rails', '4.1.0.0'

# javascipt
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
# gem 'turbolinks'

# document
gem 'sdoc', '~> 0.4.0',          group: :doc

# application preloader
gem 'spring',        group: :development

# app server
gem 'unicorn'

# deploy
gem 'capistrano-rails', group: :development

group :development do
  # enhancement
  gem 'erd'
  gem 'annotate'
end

group :development, :test do
  # model generator
  gem 'factory_girl_rails'

  # debugger
  gem 'pry', '< 0.10.0'
  gem 'pry-rails'
  gem 'hirb-unicode'
  gem 'byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :test do
  # test
  gem 'rspec', '~> 3.0', group: [:development]
  gem 'rspec-rails', '~> 3.0', group: [:development]
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end
