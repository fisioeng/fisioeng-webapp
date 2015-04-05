require 'test_helper'

class SamplingsControllerTest < ActionController::TestCase
  setup do
    @sampling = samplings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:samplings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sampling" do
    assert_difference('Sampling.count') do
      post :create, sampling: { analyte_id: @sampling.analyte_id, name: @sampling.name }
    end

    assert_redirected_to sampling_path(assigns(:sampling))
  end

  test "should show sampling" do
    get :show, id: @sampling
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sampling
    assert_response :success
  end

  test "should update sampling" do
    patch :update, id: @sampling, sampling: { analyte_id: @sampling.analyte_id, name: @sampling.name }
    assert_redirected_to sampling_path(assigns(:sampling))
  end

  test "should destroy sampling" do
    assert_difference('Sampling.count', -1) do
      delete :destroy, id: @sampling
    end

    assert_redirected_to samplings_path
  end
end
