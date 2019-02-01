class CreateInstructorCompagnion < ActiveRecord::Migration
  def up
    create_table :instructor_compagnions do |t|
      t.integer :instructor_id, unique: true
      t.string :departement_name
      t.references :instructor
    end
  end
  def down
      drop_table :instructor_compagnions
  end
end
