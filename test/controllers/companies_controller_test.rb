require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase

	include Devise::Test::ControllerHelpers
	
  test "should get index" do
  	get :index
  	assert_response :success
  	assert_not_nil assigns(:companies)
  end
end
