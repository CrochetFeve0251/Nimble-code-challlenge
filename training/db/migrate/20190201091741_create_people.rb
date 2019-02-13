class CreatePeople < ActiveRecord::Migration
  def up
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :login, unique: true
      t.integer :citizen_id, unique: true

      t.timestamps null: false
    end
  end
  def down
    drop_table :people
  end
end
