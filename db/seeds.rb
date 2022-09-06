# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create([{ username: "Dareos", email: "dareos@dareos.com", password: "123456" }])
City.create([{ name: "London" }, { name: "Berlin" }])
Post.create(
  user_id: "1",
  city_id: "1",
  title: "B", category: "movie",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)

Post.create(
  user_id: "1",
  city_id: "2",
  title: "Star Wars",
  category: "movie",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)
