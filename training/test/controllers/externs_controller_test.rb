require 'test_helper'

class ExternsControllerTest < ActionController::TestCase
    setup do
    @person = people(:one)
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

  test "should create person" do
    Extern.destroy_all
    assert_difference('Extern.count') do
      post :create, extern: { citizen_id: @person.citizen_id, firstname: @person.firstname, lastname: @person.lastname, login: @person.login, password: @person.password }
    end
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update extern" do
    patch :update, id: @person, extern: { citizen_id: @person.citizen_id, firstname: @person.firstname, lastname: @person.lastname, login: @person.login, password: @person.password }
    assert extern_path(assigns(:person))
  end

  test "should destroy extern" do
    assert_difference('Extern.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to externs_path
  end
end
