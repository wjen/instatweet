User.delete_all

user = User.new(email: "wen@gmail.com",
                password: "123456",
                password_confirmation: "123456"
                )
user.save

wen = User.new(email: "wen@gmail.com",
               password: "123456",
               password_confirmation: "123456",
               handle: "wentin",
               profile_url: "https://ga-core.s3.amazonaws.com/production/uploads/instructor/image/6752/thumb_harsh_ez.jpg",
               statement: "Weeee!!!"
               )
wen.save
