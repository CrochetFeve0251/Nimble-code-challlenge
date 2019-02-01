require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  
    setup do
    @people = people(:one)
    @student_compagnon = student_compagnons(:one)
    Student.destroy_all
    StudentCompagnon.destroy_all
  end
  
  test "should not save student without attributes" do
    student = Student.new
    assert_not student.save
  end
  
  test "should save student" do
    student = Student.new
    student.firstname = @people.firstname
    student.lastname = @people.lastname
    student.citizen_id = @people.citizen_id
    student.login = @people.login
    student.password = @people.password
    student.student_id = @student_compagnon.student_id
    assert student.save
  end
  
  test "shouldn't save student with student_id" do
    student = Student.new
    student.firstname = @people.firstname
    student.lastname = @people.lastname
    student.citizen_id = @people.citizen_id
    student.login = @people.login
    student.password = @people.password
    student.student_id = nil
    assert_not student.save
  end
  
  test "shouldn't save student with a student_id already defined" do
    second_student_values = people(:one)
    student = Student.new
    second_student = Student.new
    student.firstname = @people.firstname
    student.lastname = @people.lastname
    student.citizen_id = @people.citizen_id
    student.login = @people.login
    student.password = @people.password
    student.student_id = @student_compagnon.student_id
    second_student.firstname = @people.firstname
    second_student.lastname = @people.lastname
    second_student.citizen_id = @people.citizen_id
    second_student.login = @people.login
    second_student.password = @people.password
    second_student.student_id = @student_compagnon.student_id
    assert student.save
    assert_not second_student.save
  end
  
  test "should be able to recreate the same after deleting" do
    student = Student.new
    second_student = Student.new
    student.firstname = @people.firstname
    student.lastname = @people.lastname
    student.citizen_id = @people.citizen_id
    student.login = @people.login
    student.password = @people.password
    student.student_id = @student_compagnon.student_id
    assert student.save
    assert student.delete
    student = Student.new
    second_student = Student.new
    student.firstname = @people.firstname
    student.lastname = @people.lastname
    student.citizen_id = @people.citizen_id
    student.login = @people.login
    student.password = @people.password
    student.student_id = @student_compagnon.student_id
    assert student.save
  end
end
