Product.destroy_all
User.destroy_all

50.times do
  new_prod = Product.new(
                name: Faker::ElderScrolls.dragon,
                price: Faker::Number.decimal(2,2)
  )
  new_prod.photo = URI.parse(Faker::LoremPixel.image("600x600"))
  new_prod.save
end

p "Created #{Product.count} products"

User.create!(email: 'test@gmail.com',
          password: 'password',
          admin: true)
p "Created #{User.count} users"
