class CreateCourse < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.string :subject
      t.belongs_to :instructor, index: true
    end
  end
  def down
      drop_table :courses
    end
end
