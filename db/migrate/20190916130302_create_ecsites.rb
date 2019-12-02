class CreateEcsites < ActiveRecord::Migration[5.2]
  def change
    create_table :ecsites do |t|
      t.string :name
      t.string :siteurl
      t.string :imageurl
    end
  end
end
