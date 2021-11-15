require 'test_helper'

class DwarvesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dwarves_index_url
    assert_response :success
  end

  test "should get new" do
    get dwarves_new_url
    assert_response :success
  end

  test "should get create" do
    get dwarves_create_url
    assert_response :success
  end

  test "should get show" do
    get dwarves_show_url
    assert_response :success
  end

  test "should get edit" do
    get dwarves_edit_url
    assert_response :success
  end

  test "should get update" do
    get dwarves_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dwarves_destroy_url
    assert_response :success
  end

end
