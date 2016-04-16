# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Load application roles
customer = Role.create!({name: 'customer'})
admin = Role.create!({name: 'admin'})

# Load mock users
User.create!({email: 'admin@example.net', password: 'Example123', role: admin})
User.create!({email: 'stiven@example.net', password: 'Example123', role: customer})