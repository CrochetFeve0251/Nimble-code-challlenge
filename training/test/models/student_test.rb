require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  
    setup do
    @people = people(:one)
    @student_compagnion = student_compagnions(:one)
    Person.destroy_all
    Student.destroy_all
    StudentCompagnion.destroy_all
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
    student.email = @people.email
    student.password = @people.password
    student.student_number = @student_compagnion.student_number
    assert student.save
  end
  
  test "shouldn't save student without student_number" do
    student = Student.new
    student.firstname = @people.firstname
    student.lastname = @people.lastname
    student.citizen_id = @people.citizen_id
    student.login = @people.login
    student.password = @people.password
    student.email = @people.email
    student.student_number = nil
    assert_not student.save
  end
  
  test "shouldn't save student with a student_number already defined" do
    second_student_values = people(:one)
    student = Student.new
    second_student = Student.new
    student.firstname = @people.firstname
    student.lastname = @people.lastname
    student.citizen_id = @people.citizen_id
    student.login = @people.login
    student.password = @people.password
    student.email = @people.email
    student.student_number = @student_compagnion.student_number
    second_student.firstname = @people.firstname
    second_student.lastname = @people.lastname
    second_student.citizen_id = @people.citizen_id
    second_student.login = @people.login
    second_student.password = @people.password
    second_student.email = @people.email
    second_student.student_number = @student_compagnion.student_number
    assert student.save
    assert_not second_student.save
  end
  
  test "should be able to recreate the same after deleting" do
    student = Student.new
    student.firstname = @people.firstname
    student.lastname = @people.lastname
    student.citizen_id = @people.citizen_id
    student.login = @people.login
    student.password = @people.password
    student.email = @people.email
    student.student_number = @student_compagnion.student_number
    assert student.save
    assert student.destroy
    student = Student.new
    student.firstname = @people.firstname
    student.lastname = @people.lastname
    student.citizen_id = @people.citizen_id
    student.login = @people.login
    student.email = @people.email
    student.password = @people.password
    student.student_number = @student_compagnion.student_number
    assert student.save
  end
end
