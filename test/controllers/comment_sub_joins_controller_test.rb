require 'test_helper'

class CommentSubJoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_sub_join = comment_sub_joins(:one)
  end

  test "should get index" do
    get comment_sub_joins_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_sub_join_url
    assert_response :success
  end

  test "should create comment_sub_join" do
    assert_difference('CommentSubJoin.count') do
      post comment_sub_joins_url, params: { comment_sub_join: {  } }
    end

    assert_redirected_to comment_sub_join_url(CommentSubJoin.last)
  end

  test "should show comment_sub_join" do
    get comment_sub_join_url(@comment_sub_join)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_sub_join_url(@comment_sub_join)
    assert_response :success
  end

  test "should update comment_sub_join" do
    patch comment_sub_join_url(@comment_sub_join), params: { comment_sub_join: {  } }
    assert_redirected_to comment_sub_join_url(@comment_sub_join)
  end

  test "should destroy comment_sub_join" do
    assert_difference('CommentSubJoin.count', -1) do
      delete comment_sub_join_url(@comment_sub_join)
    end

    assert_redirected_to comment_sub_joins_url
  end
end
