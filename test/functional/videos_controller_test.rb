require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  setup do
    @video = videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create video" do
    assert_difference('Video.count') do
      post :create, video: { last_week_rank: @video.last_week_rank, plus_minus_view: @video.plus_minus_view, this_week_rank: @video.this_week_rank, this_week_view: @video.this_week_view, time_since_upload: @video.time_since_upload, total_aggregate_view: @video.total_aggregate_view, video_name: @video.video_name, weeks_on_chart: @video.weeks_on_chart }
    end

    assert_redirected_to video_path(assigns(:video))
  end

  test "should show video" do
    get :show, id: @video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @video
    assert_response :success
  end

  test "should update video" do
    put :update, id: @video, video: { last_week_rank: @video.last_week_rank, plus_minus_view: @video.plus_minus_view, this_week_rank: @video.this_week_rank, this_week_view: @video.this_week_view, time_since_upload: @video.time_since_upload, total_aggregate_view: @video.total_aggregate_view, video_name: @video.video_name, weeks_on_chart: @video.weeks_on_chart }
    assert_redirected_to video_path(assigns(:video))
  end

  test "should destroy video" do
    assert_difference('Video.count', -1) do
      delete :destroy, id: @video
    end

    assert_redirected_to videos_path
  end
end
