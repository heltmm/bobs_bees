class AddPhotosToProducts < ActiveRecord::Migration[5.1]
  def change
    change_table :products do |t|
      t.attachment :photo
    end
  end
end
