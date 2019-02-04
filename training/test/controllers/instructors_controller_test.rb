require 'test_helper'

class InstructorsControllerTest < ActionController::TestCase
    setup do
    @person = people(:one)
    @instructor_compagnion = instructor_compagnions(:one)
    Person.destroy_all
    Instructor.destroy_all
    InstructorCompagnion.destroy_all
    instructor = Instructor.new
    instructor.citizen_id = @person.citizen_id
    instructor.firstname = @person.firstname
    instructor.lastname = @person.lastname
    instructor.login = @person.login
    instructor.password = @person.password
    instructor.instructor_number = @instructor_compagnion.instructor_number
    instructor.departement_name = @instructor_compagnion.departement_name
    instructor.save
    @id_instructor = instructor.id
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

  test "should create instructor" do
    Instructor.destroy_all
    assert_difference('Instructor.count') do
      post :create, instructor: { citizen_id: @person.citizen_id, firstname: @person.firstname, lastname: @person.lastname, login: @person.login, password: @person.password, instructor_number: @instructor_compagnion.instructor_number, departement_name: @instructor_compagnion.departement_name }
    end
  end

  test "should show instructor" do
    get :show, id: @id_instructor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @id_instructor
    assert_response :success
  end

  test "should update person" do
    patch :update, id: @id_instructor, instructor: { citizen_id: @person.citizen_id, firstname: @person.firstname, lastname: @person.lastname, login: @person.login, password: @person.password, instructor_number: @instructor_compagnion.instructor_number, departement_name: @instructor_compagnion.departement_name }
    assert instructor_path(assigns(:person))
  end

  test "should destroy instructor" do
    assert_difference('Instructor.count', -1) do
      delete :destroy, id: @id_instructor
    end

    assert_redirected_to instructors_path
  end
end
