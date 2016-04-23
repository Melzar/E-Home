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
steven_user = User.create!({email: 'steven@example.net', password: 'Example123', role: customer})

Customer.create!({first_name: 'Steven',
                  last_name: 'Seagal',
                  phone_number: '000-000',
                  address_1: 'Winston Street',
                  address_2: 'Maine 20',
                  city: 'New York',
                  zip: '000-000',
                  user: steven_user
                  })