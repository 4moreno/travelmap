# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

User.create(username: "Dareos", email: "dareos@dareos.com", password: "111111")
User.create(username: "Yuki", email: "yuki@dareos.com", password: "222222")
User.create(username: "Sonja", email: "sareos@dareos.com", password: "333333")
User.create(username: "Jose", email: "jareos@dareos.com", password: "444444")
User.create(username: "George", email: "gareos@dareos.com", password: "555555")
User.create(username: "Jess", email: "jess@dareos.com", password: "666666")
User.create(username: "Camila", email: "camila@dareos.com", password: "777777")
User.create(username: "Ernesto", email: "ernesto@dareos.com", password: "888888")
User.create(username: "Sergio", email: "sergio@dareos.com", password: "999999")
User.create(username: "Elbay", email: "elbay@dareos.com", password: "000000")

cities = City.create([{ name: "London" }, { name: "Madrid" }, { name: "Bilbao" }, { name: "Sevilla" }, { name: "Paris" }, { name: "Berlin" }, { name: "Glasgow" }, { name: "Manchester" }, { name: "Liverpool" }, { name: "Oslo" }])

Post.create(
  user_id: "1",
  city_id: "2",
  address: "Calle de Maldonado, 51, 28006 Madrid, Spain",
  title: "Star Wars",
  category: "movie",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)

Post.create(
  user_id: "2",
  city_id: "3",
  address: "Labayru Kalea, 15 -17, 48012 Bilbo, Bizkaia, Spain",
  title: "Break and Fast",
  category: "food",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)

Post.create(
  user_id: "2",
  city_id: "4",
  address: "C. Cristalería, Km 1, 41020 Sevilla, Spain",
  title: "Bar Manolo",
  category: "food",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)


Post.create(
  user_id: "3",
  city_id: "5",
  address: "1 Av. de la Paix, 92140 Clamart, France",
  title: "Michelle",
  category: "food",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)

Post.create(
  user_id: "3",
  city_id: "6",
  address: "Goerzallee 189-223, 14167 Berlin, Germany",
  title: "Militar History",
  category: "entertainment",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)

Post.create(
  user_id: "3",
  city_id: "7",
  address: "38 Fenwick Rd, Giffnock, Glasgow G46 6AA, United Kingdom",
  title: "Comedy show",
  category: "entertainment",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)

Post.create(
  user_id: "4",
  city_id: "8",
  address: "Oxford Rd, Manchester M15 6ER, United Kingdom",
  title: "Lion King",
  category: "entertainment",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)

Post.create(
  user_id: "5",
  city_id: "9",
  address: "Retail Park, Edge Ln, Montrose Wy., Old Swan, Liverpool L13 1EW, United Kingdom",
  title: "Football match",
  category: "sport",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)

Post.create(
  user_id: "6",
  city_id: "10",
  address: "Ullevålsveien 43, 0171 Oslo, Norway",
  title: "Ice hockey",
  category: "sport",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)

Post.create(
  user_id: "6",
  city_id: "10",
  address: "Prinsens gate 2 b, 0152 Oslo, Norway",
  title: "Nordic Festival",
  category: "entertainment",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)

Post.create(
  user_id: "7",
  city_id: "2",
  address: "Pl. de San Andrés, 2, 28005 Madrid, Spain",
  title: "El corte ingles",
  category: "shopping",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)

Post.create(
  user_id: "8",
  city_id: "1",
  address: "3 Abbey Rd, London NW8 9AY, United Kingdom",
  title: "Spanish tapas",
  category: "food",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)

Post.create(
  user_id: "9",
  city_id: "4",
  address: "Av. Isabel la Católica, 41004 Sevilla, Spain",
  title: "Casa Arturo",
  category: "food",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)

Post.create(
  user_id: "9",
  city_id: "7",
  address: "190 Cathedral St, Glasgow G4 0RF, United Kingdom",
  title: "Musical",
  category: "entertainment",
  description: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna"
)
