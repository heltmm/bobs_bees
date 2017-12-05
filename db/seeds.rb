
User.destroy_all
Account.destroy_all

User.create!(email: 'test@gmail.com',
          password: 'password',
          admin: true)
Account.create
p "Created #{User.count} users"

50.times do
   Product.create!(
                name: Faker::Commerce.product_name,
                price: Faker::Number.decimal(2,2),
                photo: URI.parse(Faker::LoremPixel.image("600x600"))
                )
end

p "Created #{Product.count} products"
