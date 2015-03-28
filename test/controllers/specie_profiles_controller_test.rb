require 'test_helper'

class SpecieProfilesControllerTest < ActionController::TestCase
  setup do
    @specie_profile = specie_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specie_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create specie_profile" do
    assert_difference('SpecieProfile.count') do
      post :create, specie_profile: { alias: @specie_profile.alias, description: @specie_profile.description, especiename: @specie_profile.especiename, max_relative_humidity: @specie_profile.max_relative_humidity, max_surface_temperature: @specie_profile.max_surface_temperature, max_temperature: @specie_profile.max_temperature, min_heart_frequency: @specie_profile.min_heart_frequency, min_relative_humidity: @specie_profile.min_relative_humidity, min_surface_temperature: @specie_profile.min_surface_temperature, min_temperature: @specie_profile.min_temperature }
    end

    assert_redirected_to specie_profile_path(assigns(:specie_profile))
  end

  test "should show specie_profile" do
    get :show, id: @specie_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @specie_profile
    assert_response :success
  end

  test "should update specie_profile" do
    patch :update, id: @specie_profile, specie_profile: { alias: @specie_profile.alias, description: @specie_profile.description, especiename: @specie_profile.especiename, max_relative_humidity: @specie_profile.max_relative_humidity, max_surface_temperature: @specie_profile.max_surface_temperature, max_temperature: @specie_profile.max_temperature, min_heart_frequency: @specie_profile.min_heart_frequency, min_relative_humidity: @specie_profile.min_relative_humidity, min_surface_temperature: @specie_profile.min_surface_temperature, min_temperature: @specie_profile.min_temperature }
    assert_redirected_to specie_profile_path(assigns(:specie_profile))
  end

  test "should destroy specie_profile" do
    assert_difference('SpecieProfile.count', -1) do
      delete :destroy, id: @specie_profile
    end

    assert_redirected_to specie_profiles_path
  end
end
