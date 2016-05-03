begin
  require 'database_cleaner'
  require 'database_cleaner/cucumber'

  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end

Before('@truncation') do
  DatabaseCleaner.start
end

Before('~@truncation') do
  DatabaseCleaner.start
end

After('@truncation') do
  DatabaseCleaner.clean
end

After('~@truncation') do
  DatabaseCleaner.clean
end