require 'test_helper'

class PlaylistsControllerTest < ActionController::TestCase
  setup do
    @playlist = playlists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:playlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create playlist" do
    assert_difference('Playlist.count') do
      post :create, playlist: { comments: @playlist.comments, last_week_rank: @playlist.last_week_rank, playlist_name: @playlist.playlist_name, shares: @playlist.shares, this_week_rank: @playlist.this_week_rank, this_week_views: @playlist.this_week_views, total_aggregate_views: @playlist.total_aggregate_views, video_in_series: @playlist.video_in_series, weekly_view: @playlist.weekly_view }
    end

    assert_redirected_to playlist_path(assigns(:playlist))
  end

  test "should show playlist" do
    get :show, id: @playlist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @playlist
    assert_response :success
  end

  test "should update playlist" do
    put :update, id: @playlist, playlist: { comments: @playlist.comments, last_week_rank: @playlist.last_week_rank, playlist_name: @playlist.playlist_name, shares: @playlist.shares, this_week_rank: @playlist.this_week_rank, this_week_views: @playlist.this_week_views, total_aggregate_views: @playlist.total_aggregate_views, video_in_series: @playlist.video_in_series, weekly_view: @playlist.weekly_view }
    assert_redirected_to playlist_path(assigns(:playlist))
  end

  test "should destroy playlist" do
    assert_difference('Playlist.count', -1) do
      delete :destroy, id: @playlist
    end

    assert_redirected_to playlists_path
  end
end
