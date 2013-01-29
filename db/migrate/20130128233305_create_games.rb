class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.float :latitude_goal
      t.float :longitude_goal
      t.boolean :is_active

      t.timestamps
    end
  end
end
