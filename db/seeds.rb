User.create!(name:  "sizma",
             email: "meda829ratteru86@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

3.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@foobar.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
3.times do
  title = Faker::Lorem.sentence(5)
  users.each {|user| user.posts.create!(title: title)}
end
