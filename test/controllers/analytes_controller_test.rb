require 'test_helper'

class AnalytesControllerTest < ActionController::TestCase
  setup do
    @analyte = analytes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:analytes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create analyte" do
    assert_difference('Analyte.count') do
      post :create, analyte: { birthdate: @analyte.birthdate, branch_id: @analyte.branch_id, code: @analyte.code, color: @analyte.color, lanado: @analyte.lanado, name: @analyte.name, specie_profile_id: @analyte.specie_profile_id, weight: @analyte.weight }
    end

    assert_redirected_to analyte_path(assigns(:analyte))
  end

  test "should show analyte" do
    get :show, id: @analyte
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @analyte
    assert_response :success
  end

  test "should update analyte" do
    patch :update, id: @analyte, analyte: { birthdate: @analyte.birthdate, branch_id: @analyte.branch_id, code: @analyte.code, color: @analyte.color, lanado: @analyte.lanado, name: @analyte.name, specie_profile_id: @analyte.specie_profile_id, weight: @analyte.weight }
    assert_redirected_to analyte_path(assigns(:analyte))
  end

  test "should destroy analyte" do
    assert_difference('Analyte.count', -1) do
      delete :destroy, id: @analyte
    end

    assert_redirected_to analytes_path
  end
end
