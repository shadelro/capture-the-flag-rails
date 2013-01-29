class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :game_id
      t.integer :user_id

      t.timestamps
    end

    add_index :registrations, [:game_id, :user_id], unique: true
  end
end
