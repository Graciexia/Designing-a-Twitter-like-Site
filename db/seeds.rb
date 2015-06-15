user = User.create(name: Faker::Name.name, email: Faker::Internet.email)
tweet = Tweet.create(body: Faker::Lorem.paragraph)
User.create(name: Faker::Name.name, email: Faker::Internet.email)
