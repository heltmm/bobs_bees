class CreateAddress < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :account_id
      t.string :full_name
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.integer :zipcode
    end
  end
end
