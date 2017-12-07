class CreateAddress < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :account_id
      t.integer :order_id
      t.string :full_name
      t.string :street1
      t.string :street2
      t.string :state
      t.string :city
      t.integer :zipcode
    end
  end
end
