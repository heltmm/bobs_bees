class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.column :content_body, :string
      t.column :rating, :integer
      t.column :product_id, :integer
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
