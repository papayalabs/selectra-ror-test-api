# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = {  name: "Manuel Fernandez",
          email: "papayalabs@gmail.com",
          password: "password",
          password_confirmation: "password",
          api_key: 111111 #SecureRandom.uuid
        }
puts 'Seeding Users...'
User.create!(user)

provider = { name: "Telefonica"}
Provider.create!(provider)
