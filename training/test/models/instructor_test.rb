require 'test_helper'

class InstructorTest < ActiveSupport::TestCase
     setup do
    @people = people(:one)
    @instructor_compagnion = instructor_compagnions(:one)
    Instructor.destroy_all
    InstructorCompagnion.destroy_all
  end
  
  test "should not save instructor without attributes" do
    instructor = Instructor.new
    assert_not instructor.save
  end
  
  test "should save instructor" do
    instructor = Instructor.new
    instructor.firstname = @people.firstname
    instructor.lastname = @people.lastname
    instructor.citizen_id = @people.citizen_id
    instructor.login = @people.login
    instructor.password = @people.password
    instructor.departement_name = @instructor_compagnion.departement_name
    instructor.instructor_id = @instructor_compagnion.instructor_id
    assert instructor.save
  end
  
  test "shouldn't save instructor with instructor_id" do
    instructor = Instructor.new
    instructor.firstname = @people.firstname
    instructor.lastname = @people.lastname
    instructor.citizen_id = @people.citizen_id
    instructor.login = @people.login
    instructor.password = @people.password
    instructor.departement_name = @instructor_compagnion.departement_name
    instructor.instructor_id = nil
    assert_not instructor.save
  end
  
   test "shouldn't save instructor with departement_name" do
    instructor = Instructor.new
    instructor.firstname = @people.firstname
    instructor.lastname = @people.lastname
    instructor.citizen_id = @people.citizen_id
    instructor.login = @people.login
    instructor.password = @people.password
    instructor.departement_name = nil
    instructor.instructor_id = @instructor_compagnion.instructor_id
    assert_not instructor.save
  end
  
  test "shouldn't save instructor with a instructor_id already defined" do
    second_instructor_values = people(:one)
    instructor = Instructor.new
    second_instructor = Instructor.new
    instructor.firstname = @people.firstname
    instructor.lastname = @people.lastname
    instructor.citizen_id = @people.citizen_id
    instructor.login = @people.login
    instructor.password = @people.password
    instructor.departement_name = @instructor_compagnion.departement_name
    instructor.instructor_id = @instructor_compagnion.instructor_id
    second_instructor.firstname = @people.firstname
    second_instructor.lastname = @people.lastname
    second_instructor.citizen_id = @people.citizen_id
    second_instructor.login = @people.login
    second_instructor.password = @people.password
    second_instructor.departement_name = @instructor_compagnion.departement_name
    second_instructor.instructor_id = @instructor_compagnion.instructor_id
    assert instructor.save
    assert_not second_instructor.save
  end
  
  test "should be able to recreate the same after deleting" do
    instructor = Instructor.new
    second_instructor = Instructor.new
    instructor.firstname = @people.firstname
    instructor.lastname = @people.lastname
    instructor.citizen_id = @people.citizen_id
    instructor.login = @people.login
    instructor.password = @people.password
    instructor.departement_name = @instructor_compagnion.departement_name
    instructor.instructor_id = @instructor_compagnion.instructor_id
    assert instructor.save
    assert instructor.delete
    instructor = Instructor.new
    second_instructor = Instructor.new
    instructor.firstname = @people.firstname
    instructor.lastname = @people.lastname
    instructor.citizen_id = @people.citizen_id
    instructor.login = @people.login
    instructor.password = @people.password
    instructor.departement_name = @instructor_compagnion.departement_name
    instructor.instructor_id = @instructor_compagnion.instructor_id
    assert instructor.save
  end
end
