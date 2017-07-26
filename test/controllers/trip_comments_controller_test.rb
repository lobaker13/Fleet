require 'test_helper'

class TripCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip_comment = trip_comments(:one)
  end

  test "should get index" do
    get trip_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_comment_url
    assert_response :success
  end

  test "should create trip_comment" do
    assert_difference('TripComment.count') do
      post trip_comments_url, params: { trip_comment: { body: @trip_comment.body, trip_id: @trip_comment.trip_id, user_id: @trip_comment.user_id } }
    end

    assert_redirected_to trip_comment_url(TripComment.last)
  end

  test "should show trip_comment" do
    get trip_comment_url(@trip_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_comment_url(@trip_comment)
    assert_response :success
  end

  test "should update trip_comment" do
    patch trip_comment_url(@trip_comment), params: { trip_comment: { body: @trip_comment.body, trip_id: @trip_comment.trip_id, user_id: @trip_comment.user_id } }
    assert_redirected_to trip_comment_url(@trip_comment)
  end

  test "should destroy trip_comment" do
    assert_difference('TripComment.count', -1) do
      delete trip_comment_url(@trip_comment)
    end

    assert_redirected_to trip_comments_url
  end
end
