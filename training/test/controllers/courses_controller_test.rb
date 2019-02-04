require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @person = people(:one)
    @course = courses(:one)
    @instructor_compagnion = instructor_compagnions(:one)
    Course.destroy_all
    Instructor.destroy_all
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
    course = Course.new
    course.subject = @course.subject
    course.instructor = instructor
    course.save
    @id_course = course.id
    @id_instructor = instructor.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    Course.destroy_all
    assert_difference('Course.count') do
      post :create, course: { subject: @course.subject, instructor_id: @id_instructor }
    end
  end
  
  test "should show course" do
    get :show, id: @id_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @id_course
    assert_response :success
  end

  test "should update course" do
    patch :update, id: @id_course, course: { subject: @course.subject, instructor_id: @id_instructor }
    assert course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @id_course
    end

    assert_redirected_to courses_path
  end
end
