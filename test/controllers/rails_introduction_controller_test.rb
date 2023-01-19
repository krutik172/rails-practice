require "test_helper"

class RailsIntroductionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rails_introduction_index_url
    assert_response :success
  end
end
