
User.destroy_all
Account.destroy_all
Order.destroy_all
OrderItem.destroy_all

p "Destroyed"

u = User.create!(email: 'test@gmail.com',
          password: 'password',
          admin: true)

Account.create!(:user_id => u.id)

p "Created #{User.count} users"

20.times do
   Product.create!(
                name: Faker::Commerce.product_name,
                price: Faker::Number.decimal(2,2),
                photo: URI.parse(Faker::LoremPixel.image("600x600"))
                )
end

p "Created #{Product.count} products"
