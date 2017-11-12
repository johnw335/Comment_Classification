require 'test_helper'

class CommentWordJoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_word_join = comment_word_joins(:one)
  end

  test "should get index" do
    get comment_word_joins_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_word_join_url
    assert_response :success
  end

  test "should create comment_word_join" do
    assert_difference('CommentWordJoin.count') do
      post comment_word_joins_url, params: { comment_word_join: {  } }
    end

    assert_redirected_to comment_word_join_url(CommentWordJoin.last)
  end

  test "should show comment_word_join" do
    get comment_word_join_url(@comment_word_join)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_word_join_url(@comment_word_join)
    assert_response :success
  end

  test "should update comment_word_join" do
    patch comment_word_join_url(@comment_word_join), params: { comment_word_join: {  } }
    assert_redirected_to comment_word_join_url(@comment_word_join)
  end

  test "should destroy comment_word_join" do
    assert_difference('CommentWordJoin.count', -1) do
      delete comment_word_join_url(@comment_word_join)
    end

    assert_redirected_to comment_word_joins_url
  end
end
