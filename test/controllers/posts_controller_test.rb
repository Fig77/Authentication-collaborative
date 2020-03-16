require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get root_path
    assert_response :success
  end

  test 'should get create' do
    get root_path
    assert_response :success
  end

  test 'should get index' do
    get root_path
    assert_response :success
  end
end
