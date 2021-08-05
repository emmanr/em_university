# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create(email: "testmail01@test.com", password: "password", password_confirmation: "password", first_name: "Zero One", last_name: "Testmail")
Student.create(email: "mailtest02@test.com", password: "password", password_confirmation: "password", first_name: "Two", last_name: "Mailtest")
Student.create(email: "mtts_test03@test.com", password: "password", password_confirmation: "password", first_name: "Three", last_name: "Sampletest")
Student.update_all confirmed_at: DateTime.now
