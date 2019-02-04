require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
    setup do
    @person = people(:one)
    @student_compagnion = student_compagnions(:one)
    Student.destroy_all
    StudentCompagnion.destroy_all
    student = Student.new
    student.citizen_id = @person.citizen_id
    student.firstname = @person.firstname
    student.lastname = @person.lastname
    student.login = @person.login
    student.password = @person.password
    student.student_number = @student_compagnion.student_number
    student.save
    @id_student = student.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    Student.destroy_all
    assert_difference('Student.count') do
      post :create, student: { citizen_id: @person.citizen_id, firstname: @person.firstname, lastname: @person.lastname, login: @person.login, password: @person.password, student_number: @student_compagnion.student_number, }
    end
  end

  test "should show student" do
    get :show, id: @id_student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @id_student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @id_student, student: { citizen_id: @person.citizen_id, firstname: @person.firstname, lastname: @person.lastname, login: @person.login, password: @person.password, student_number: @student_compagnion.student_number }
    assert student_path(assigns(:person))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @id_student
    end

    assert_redirected_to students_path
  end
end
