class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :lastname
      t.string :login
      t.string :password
      t.integer :citizen_id

      t.timestamps null: false
    end
  end
end
