class CreateStudentCompagnon < ActiveRecord::Migration
  def up
    create_table :student_compagnons do |t|
      t.integer :student_id, unique: true
      t.references :students
    end
  end
  def down
    drop_table :student_compagnons
  end
end
