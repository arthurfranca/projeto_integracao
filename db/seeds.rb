# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Page.create(title: "blah", feeds: [
#   Feed.new(source: "blahblah", user: "me!"),
#   Feed.new(....),
#   Feed.new(.....),
# ])

# (1..5).each do |i|
#   page = Page.create(title: "Page #{i}", userID: "EMAIL@gmail.com", presentation: 'cards', customURL: "testing#{i}")

#   3.times { Feed.create(page: page) }
# end
Client.create([
{
  cpf: "12345678910",
  name: "Clarissa",
  email: "cla@ig.com.br",
  phone: "3778-5498",
  address: "Rua X, Apt Y, CEP 20000-000"
},
{
  cpf: "10987654321",
  name: "Arthur",
  email: "art@ig.com.br",
  phone: "3711-5498",
  address: "Rua Z, Apt Y, CEP 20000-040"
},
{
  cpf: "64792847490",
  name: "Ichigo",
  email: "ich@ig.com.br",
  phone: "3778-5498",
  address: "Rua X, Apt Y, CEP 20000-030"
},
{
  cpf: "32423554366",
  name: "Eve",
  email: "eve@ig.com.br",
  phone: "3728-5498",
  address: "Rua X, Apt Y, CEP 20000-020"
},
{
  cpf: "34534536754",
  name: "Daniel Robson",
  email: "dan@ig.com.br",
  phone: "3478-5498",
  address: "Rua X, Apt Y, CEP 20000-010"
}])
Admin.create(registry: "admin", password: "admin")
Price.create(per_km: 0.55, percentage: 50)
Manufacturer.create([
{
  name: 'Ford',
  models: Model.create([
          {
            name: 'Focus',
            vehicles: Vehicle.create([
                      {
                        year: "2000",
                        plate: "ADK234",
                        base_value: 200.00
                      },
                      {
                        year: "2001",
                        plate: "BVF123",
                        base_value: 220.00
                      }])
          },
          {
            name: 'Fiesta',
            vehicles: Vehicle.create([
                      {
                        year: "2000",
                        plate: "SJL123",
                        base_value: 200.00
                      },
                      {
                        year: "2001",
                        plate: "NGT287",
                        base_value: 220.00
                      }])
          }])
},
{
  name: 'Kia',
  models: Model.create([
          {
            name: 'Picanto',
            vehicles: Vehicle.create([
                      {
                        year: "2000",
                        plate: "KHF093",
                        base_value: 200.00
                      },
                      {
                        year: "2001",
                        plate: "GML234",
                        base_value: 220.00
                      }])
          },
          {
            name: 'Soul',
            vehicles: Vehicle.create([
                      {
                        year: "2000",
                        plate: "JIY243",
                        base_value: 230.00
                      },
                      {
                        year: "2001",
                        plate: "GHJ354",
                        base_value: 234.00
                      }])
          }])
},
{
  name: 'Fiat',
  models: Model.create([
          {
            name: 'Palio',
            vehicles: Vehicle.create([
                      {
                        year: "2000",
                        plate: "KHF093",
                        base_value: 130.00
                      },
                      {
                        year: "2001",
                        plate: "GML234",
                        base_value: 155.00 
                      }])
          },
          {
            name: 'Punto',
            vehicles: Vehicle.create([
                      {
                        year: "2000",
                        plate: "JIY243",
                        base_value: 200.00
                      },
                      {
                        year: "2001",
                        plate: "GHJ354",
                        base_value: 220.00
                      }])
          },
          {
            name: 'Bravo',
            vehicles: Vehicle.create([
                      {
                        year: "2010",
                        plate: "JIY243",
                        base_value: 300.00
                        statue: "fixing"
                      },
                      {
                        year: "2011",
                        plate: "GHJ354",
                        base_value: 320.00
                      }])
          },
          {
            name: 'Strada',
            vehicles: Vehicle.create([
                      {
                        year: "2008",
                        plate: "JIY243",
                        base_value: 190.00
                      },
                      {
                        year: "2006",
                        plate: "GHJ354",
                        base_value: 180.00
                      }])
          }])
}])
