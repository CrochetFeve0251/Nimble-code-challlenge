class CreateInstructorCompagnion < ActiveRecord::Migration
  def up
    create_table :instructor_compagnions do |t|
      t.integer :instructor_number, unique: true
      t.string :departement_name
      t.references :instructor, index: true, foreign_key: {on_delete: :cascade}
    end
  end
  def down
      drop_table :instructor_compagnions
  end
end
