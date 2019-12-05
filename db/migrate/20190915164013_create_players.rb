class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name, null: false, unique: true
      t.string :search_keyword
      t.string :position
      t.integer :age
      t.bigint :salary
      t.string :youtube_url
      t.string :image_url
      t.references :team, foreign_key: true
    end
  end
end
