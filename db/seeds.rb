# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 10.times { |i|
#   Todo.create!(body: "task#{i}")
# }

# 4.times { |i|
#   Todo.create!(body: "task#{i}done", done: true)
# }

User.create!(
  name: "User User",
  password: "aaaaaa",
  password_confirmation: "aaaaaa"
)

User.create!(
  name: "uoUo",
  password: 'aa',
  password_confirmation: 'aa'
)

User.create!(
  name: "qw",
  password: 'qw',
  password_confirmation: 'qw'
)