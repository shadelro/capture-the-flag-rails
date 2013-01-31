class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.float :latitude_goal
      t.float :longitude_goal
      t.boolean :in_progress

      t.timestamps
    end

    add_index :games, :name, unique: true
  end
end
