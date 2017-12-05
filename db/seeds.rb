
User.destroy_all

User.create!(email: 'test@gmail.com',
          password: 'password',
          admin: true)
p "Created #{User.count} users"

50.times do
   Product.create!(
                name: Faker::ElderScrolls.dragon,
                price: Faker::Number.decimal(2,2),
                photo: URI.parse(Faker::LoremPixel.image("600x600"))
                )
end

p "Created #{Product.count} products"
