require "test_helper"

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get first_name:string" do
    get customer_first_name:string_url
    assert_response :success
  end

  test "should get last_name:string" do
    get customer_last_name:string_url
    assert_response :success
  end

  test "should get email:string" do
    get customer_email:string_url
    assert_response :success
  end

  test "should get phone:bigint" do
    get customer_phone:bigint_url
    assert_response :success
  end
end
