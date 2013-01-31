class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.float :latitude
      t.float :longitude

      t.timestamps
    end

    add_index :users, :name, unique: true
  end
end
