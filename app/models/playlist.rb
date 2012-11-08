class Playlist < ActiveRecord::Base
  attr_accessible :playlist_id,:comments, :last_week_rank, :playlist_name, :shares, :this_week_rank, :this_week_views, :total_aggregate_views, :video_in_series, :weekly_view
end
