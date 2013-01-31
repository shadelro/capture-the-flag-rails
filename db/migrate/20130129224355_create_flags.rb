class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.integer :game_id
      t.integer :user_id
      t.float :latitude_default
      t.float :longitude_default
      t.float :latitude
      t.float :longitude
      t.timestamps
    end

    add_index :flags, :game_id, unique: true
  end
end
