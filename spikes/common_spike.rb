puts 'loaded the common spike'

# this abstracts away some common gems and setup

require 'bundler/inline'
gemfile do

  gem 'activesupport'
  gem 'dotenv'
  gem 'faraday'
	gem "faraday-detailed_logger", github: 'envylabs/faraday-detailed_logger'
  gem 'pry'                  # command line debugger
  gem 'pry-byebug'           # provides next, continue, step for pry
  gem 'pry-rails'            # automatically use pry on the console
  gem 'twilio-ruby'

end

puts 'Gems installed!'

require 'dotenv'
require 'pry'
require 'active_support'
require 'active_support/core_ext'


# Overwrite the default middleware Proc (evaluated for each request)
Faraday::Response::Logger::DEFAULT_OPTIONS[:headers] = false
Faraday::Response::Logger::DEFAULT_OPTIONS[:bodies]  = true

require 'faraday'
require 'faraday/detailed_logger'


Faraday.default_connection = Faraday.new(options = {:headers=>{}})

Dotenv.load('.env.development')

