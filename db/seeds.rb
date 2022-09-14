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

puts "delete DB"
# Bookmark.destroy_all
# Wishlist.destroy_all
# Post.destroy_all
# City.destroy_all
# User.destroy_all

User.create(username: "Dareos", email: "dareos@lewagon.com", password: "111111")
# User.create(username: "Yuki", email: "yuki@lewagon.com", password: "222222")
# User.create(username: "Sonja", email: "sonja@dlewagon.com", password: "333333")
# User.create(username: "Jose", email: "jose@lewagon.com", password: "444444")

City.create([{ name: "London" }, { name: "Madrid" }, { name: "Berlin" }, { name: "Oslo" }])

Post.create(
  user_id: "1",
  city_id: "1",
  address: "Tower Bridge Rd, London SE1 2UP, United Kingdom",
  title: "What a beautiful Landmark!",
  category: "Best spots",
  description: "Tower Bridge, the most photographed landmark,
                is one of the most popular tourist attractions in one of the world`s most popular tourist destinations,
                the historic city London."
)

Post.create(
  user_id: "1",
  city_id: "1",
  address: "London SW1A 0AA, United Kingdom",
  title: "Impressive piece of art!",
  category: "Best spots",
  description: "You've seen it on TV a thousand times, see it in person! A beautiful work of art"
)

Post.create(
  user_id: "1",
  city_id: "2",
  address: "Calle Azcona 46, 28028 Madrid Spain",
  title: "Highly recommended! `Los Montes de Galicia`",
  category: "Restaurants",
  description: "Food was amazing, service excellent and all around wonderful meal"
)

Post.create(
  user_id: "1",
  city_id: "3",
  address: "Pariser Platz, 10117 Berlin, Germany",
  title: "iconic gate, Brandenburger Tor!",
  category: "Best spots",
  description: "One of the most attractive tourist spots in Berlin.
                Good to see such old construction along with a lot of visitors."
)

Post.create(
  user_id: "1",
  city_id: "4",
  address: "0891 Oslo, Norway",
  title: "A beautiful spot for short-hiking!",
  category: "outdoors",
  description: "Amazing lake and park for nature lovers.
                An excellent place for disconnecting from the day-to-day routine."
)

Post.create(
  user_id: "1",
  city_id: "3",
  address: "Unter den Linden 2, 10117 Berlin, Germany",
  title: "Deutsches Historisches Museum",
  category: "Art&Culture",
  description: "Great exhibition on commissioned art in Third Reich and after exploring continuance of purpose.
                Awesome building! Original museum building is undergoing renovation."
)
