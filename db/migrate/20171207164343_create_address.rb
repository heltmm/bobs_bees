class CreateAddress < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :account_id
      t.string :type
      t.string :street
      t.string :state
      t.string :city
      t.integer :zipcode
    end
  end
end
