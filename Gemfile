source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'jwt'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'rubocop'
gem 'jbuilder', '~> 2.6'
gem 'bcrypt'
gem 'friendly_id', '~> 5.4.0'

group :development, :test do
  # There may be other lines in this block already. Simply append the following after:
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'main' # Previously '4-0-dev' or '4-0-maintenance' branch
  end
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'database_cleaner-active_record'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
