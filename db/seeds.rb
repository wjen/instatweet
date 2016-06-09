User.delete_all
Tweet.delete_all

User.create!(handle: "Example User",
             email: "example111@gmail.com",
             password: "foobar",
             password_confirmation: "foobar",
             admin: true)
# ! raises an exception
20.times do |n|
  handle = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
 User.create!(handle: handle,
             email: email,
             password: password,
             password_confirmation: password
             )
end
# user = User.new(email: "wjen85@gmail.com",
#                 password: "123456",
#                 password_confirmation: "123456"
#                 )
# user.save

# wen = User.new(email: "wen@gmail.com",
#                password: "123456",
#                password_confirmation: "123456",
#                handle: "wentin",
#                profile_url: "https://ga-core.s3.amazonaws.com/production/uploads/instructor/image/6752/thumb_harsh_ez.jpg",
#                statement: "Weeee!!!"
#                )
# wen.save
