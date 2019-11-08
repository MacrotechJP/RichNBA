class CreateItemUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :item_users do |t|
      t.references  :item,  index: true, foreign_key: true
      t.references  :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
