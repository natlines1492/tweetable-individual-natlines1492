# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Tweet.destroy_all
Comment.destroy_all

puts "Seeding users"
user = User.create(username: "admin", name: "admin", email: "admin@test.com", password: "123456", role: 1)
user.avatar.attach(io: File.open('app/assets/images/Imageanonymus.png'), filename: 'Imageanonymus.png')
user.save
user = User.create(username: "Diego", name: "rodrigo", email: "rodrigo@test.com", password: "123456")
user.avatar.attach(io: File.open('app/assets/images/Imagedieguito.png'), filename: 'Imagedieguito.png')
user.save
user = User.create(username: "Dog", name: "nat", email: "nat@test.com", password: "123456")
user.avatar.attach(io: File.open('app/assets/images/Imagedog.png'), filename: 'Imagedog.png')
user.save
user = User.create(username: "Thanos", name: "david", email: "david@test.com", password: "123456")
user.avatar.attach(io: File.open('app/assets/images/Imagethanos.png'), filename: 'Imagethanos.png')
user.save

puts "Seeding tweets"
tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:2 )
tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:2 )
tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:2 )
tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:2 )
tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:3 )
tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:3 )
tweet= Tweet.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:4 )

puts "Seeding comments"
comment = Comment.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:2, tweet_id:1 )
comment = Comment.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:3, tweet_id:1 )
comment = Comment.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:4, tweet_id:2 )
comment = Comment.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:2, tweet_id:1 )
comment = Comment.create(body:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.", user_id:1, tweet_id:3 )
