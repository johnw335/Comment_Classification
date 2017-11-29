require 'test_helper'

class SubWordJoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_word_join = sub_word_joins(:one)
  end

  test "should get index" do
    get sub_word_joins_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_word_join_url
    assert_response :success
  end

  test "should create sub_word_join" do
    assert_difference('SubWordJoin.count') do
      post sub_word_joins_url, params: { sub_word_join: {  } }
    end

    assert_redirected_to sub_word_join_url(SubWordJoin.last)
  end

  test "should show sub_word_join" do
    get sub_word_join_url(@sub_word_join)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_word_join_url(@sub_word_join)
    assert_response :success
  end

  test "should update sub_word_join" do
    patch sub_word_join_url(@sub_word_join), params: { sub_word_join: {  } }
    assert_redirected_to sub_word_join_url(@sub_word_join)
  end

  test "should destroy sub_word_join" do
    assert_difference('SubWordJoin.count', -1) do
      delete sub_word_join_url(@sub_word_join)
    end

    assert_redirected_to sub_word_joins_url
  end
end
