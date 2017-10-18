# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |n|
  user = User.create(email: FFaker::Internet.email, password: "password", password_confirmation: "password")
  2.times do 
    post = Post.create(user_id: user.id, body: FFaker::DizzleIpsum.phrases)
  end
  user.posts.each { |post| post.comments.create(user_id: user.id, body: "First comment by owner") }
end
