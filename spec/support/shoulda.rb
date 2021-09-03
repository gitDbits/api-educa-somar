require 'shoulda-matchers'
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    # This require statement solves the uninitialized constant / NameError issue
    require 'active_record'
    with.library :active_record
    with.library :active_model
  end
end
