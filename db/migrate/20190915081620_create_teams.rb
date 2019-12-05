class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :en_name
      t.string :conference
      t.integer :ranking
      t.string :imageurl
      t.string :youtube_url
    end
  end
end
