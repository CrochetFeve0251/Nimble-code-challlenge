class CreateCoursePeople < ActiveRecord::Migration
  def up
    create_table :courses_people, id: false do |t|
      t.belongs_to :person, index: true
      t.belongs_to :course, index: true
    end
  end
  def down
    drop_table :students_courses
  end
end
