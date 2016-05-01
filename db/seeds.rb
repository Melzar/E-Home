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

steven_customer = Customer.create!({first_name: 'Steven',
                  last_name: 'Seagal',
                  phone_number: '000-000',
                  address_1: 'Winston Street',
                  address_2: 'Maine 20',
                  city: 'New York',
                  zip: '000-000',
                  user: steven_user
                  })

flat = AccomodationType.create!({
                             name: 'flat'
                         })

house = AccomodationType.create!({
                             name: 'house'
                         })

accomodation = Accomodation.create!({
                         name: 'My Accomodation',
                         address_1: 'Wilkinson Street',
                         address_2: '50 MA Main',
                         city: 'Portland',
                         zip: '00-000',
                         latitude: '50',
                         longitude: '50',
                         accomodation_type: flat,
                         customers: [steven_customer]
                     })

room = SpaceType.create!({
                      name: 'room'
                  })
kitchen = SpaceType.create!({
                      name: 'kitchen'
                  })
guest_room = SpaceType.create!({
                      name: 'guest_room'
                  })
balkony = SpaceType.create!({
                                   name: 'balkony'
                               })


living_room_space = Space.create!({
                name: 'Living room',
                space_type: room,
                accomodation: accomodation
              })

kitchen_space = Space.create!({
                  name: 'Kitchen in saloon',
                  space_type: kitchen,
                  accomodation: accomodation
              })

guest_room_space = Space.create!({
                  name: 'Guest room near entrance',
                  space_type: guest_room,
                  accomodation: accomodation
              })

balkony_space = Space.create!({
                            name: 'Balkony in living room',
                            space_type: balkony,
                            accomodation: accomodation
                        })

sensor = ControlType.create({
                              name: 'sensor'
                            })
light_switch = ControlType.create({
                                name: 'light_switch'
                            })
electricity_socket = ControlType.create({
                                name: 'electricity_socket'
                            })

light_window_living = Control.create!({
                  name: 'Light near window',
                  state: :on,
                  space: living_room_space,
                  control_type: light_switch,
                  uuid: '1111-1111-1111-1111'
                })

light_couch_living = Control.create!({
                    name: 'Light near couch',
                    state: :on,
                    space: living_room_space,
                    control_type: light_switch,
                    uuid: '1111-1111-1111-2222'
                })

light_tv_living = Control.create!({
                    name: 'Light near tv',
                    state: :on,
                    space: living_room_space,
                    control_type: light_switch,
                    uuid: '1111-1111-1111-1111'
                })

electricity_socket_tv_guest = Control.create!({
                    name: 'Electricity socket near TV',
                    state: :on,
                    space: guest_room_space,
                    control_type: electricity_socket,
                    uuid: '1111-1111-1111-1111'
                })

electricity_socket_bed_guest = Control.create!({
                    name: 'Electricity socket near bed',
                    state: :on,
                    space: guest_room_space,
                    control_type: electricity_socket,
                    uuid: '1111-1111-1111-1111'
                })

electricity_socket_poster_guest = Control.create!({
                    name: 'Electricity socket under poster',
                    state: :on,
                    space: guest_room_space,
                    control_type: electricity_socket,
                    uuid: '1111-1111-1111-1111'
                })

no_2_sensor_kitchen = Control.create!({
                    name: 'NO2 sensor in kitchen',
                    state: :on,
                    space: kitchen_space,
                    control_type: sensor,
                    uuid: '1111-1111-1111-1111'
                })

co_2_sensor_kitchen = Control.create!({
                    name: 'CO2 sensor in kitchen',
                    state: :on,
                    space: kitchen_space,
                    control_type: sensor,
                    uuid: '1111-1111-1111-1111'
                })

temperature_sensor_kitchen = Control.create!({
                    name: 'Temperature sensor inside',
                    state: :on,
                    space: living_room_space,
                    control_type: sensor,
                    uuid: '1111-1111-1111-1111'
                })

temperature_sensor_balkony = Control.create!({
                    name: 'Temperature sensor balkony (outside)',
                    state: :on,
                    space: balkony_space,
                    control_type: sensor,
                    uuid: '1111-1111-1111-1111'
                })

[*1..100].each do |n|
  ControlLog.create!({
                         control: electricity_socket_tv_guest,
                         lux: 0.00 ,
                         humidity: 0.00,
                         temperature: 0.00,
                         db: 0.00,
                         watt: 25.00,
                         network: 0.00,
                         no_2: 0.00,
                         co_2: 0.00,
                         created_at: DateTime.now + (n * 15.minutes).minutes
                     })
end

[*1..100].each do |n|
  ControlLog.create!({
                         control: electricity_socket_bed_guest,
                         lux: 0.00 ,
                         humidity: 0.00,
                         temperature: 0.00,
                         db: 0.00,
                         watt: 15.00,
                         network: 0.00,
                         no_2: 0.00,
                         co_2: 0.00,
                         created_at: DateTime.now + (n * 15.minutes).minutes
                     })
end

[*1..100].each do |n|
  ControlLog.create!({
                         control: electricity_socket_poster_guest,
                         lux: 0.00 ,
                         humidity: 0.00,
                         temperature: 0.00,
                         db: 0.00,
                         watt: 35.00,
                         network: 0.00,
                         no_2: 0.00,
                         co_2: 0.00,
                         created_at: DateTime.now + (n * 15.minutes).minutes
                     })
end

[*1..100].each do |n|
  ControlLog.create!({
                         control: no_2_sensor_kitchen,
                         lux: 0.00 ,
                         humidity: 0.00,
                         temperature: 0.00,
                         db: 0.00,
                         watt: 0.00,
                         network: 0.00,
                         no_2: 15.00,
                         co_2: 0.00,
                         created_at: DateTime.now + (n * 15.minutes).minutes
                     })
end

[*1..100].each do |n|
  ControlLog.create!({
                         control: co_2_sensor_kitchen,
                         lux: 0.00 ,
                         humidity: 0.00,
                         temperature: 0.00,
                         db: 0.00,
                         watt: 0.00,
                         network: 0.00,
                         no_2: 0.00,
                         co_2: 15.00,
                         created_at: DateTime.now + (n * 15.minutes).minutes
                     })
end

[*1..100].each do |n|
  ControlLog.create!({
                         control: temperature_sensor_kitchen,
                         lux: 0.00 ,
                         humidity: 0.00,
                         temperature: rand(1..2) == 2 ? 22.00 + rand(1..2) : 22.00 - rand(1..2),
                         db: 0.00,
                         watt: 0.00,
                         network: 0.00,
                         no_2: 0.00,
                         co_2: 0.00,
                         created_at: DateTime.now + (n * 15.minutes).minutes
                     })
end

[*1..100].each do |n|
  ControlLog.create!({
                         control: temperature_sensor_balkony,
                         lux: 0.00 ,
                         humidity: 0.00,
                         temperature: n > 50 ? 14.00 - (rand(1..2) / n): 14.00 + (rand(1..2) / n),
                         db: 0.00,
                         watt: 0.00,
                         network: 0.00,
                         no_2: 0.00,
                         co_2: 0.00,
                         created_at: DateTime.now + (n * 15.minutes).minutes
                     })
end




