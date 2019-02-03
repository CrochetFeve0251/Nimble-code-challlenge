class CreateStudentCompagnion < ActiveRecord::Migration
  def up
    create_table :student_compagnions do |t|
      t.integer :student_number, unique: true
      t.references :student, index: true, foreign_key: {on_delete: :cascade}
    end
  end
  def down
    drop_table :student_compagnions
  end
end
