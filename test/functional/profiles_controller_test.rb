require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users('fabien').profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 not found page" do
  	get :show, id: 'doesnotexist'
    assert_response :not_found
  end

  test "that variables are assigned on successful show viewings" do
  	get :show, id: users('fabien').profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "only shows the correct user's statuses on the show page by profile" do
  	get :show, id: users('fabien').profile_name
  	assigns(:statuses).each do |status| 
  		assert_equal users(:fabien), status.user
  	end
  end

end
