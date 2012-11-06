class Video < ActiveRecord::Base
  attr_accessible :last_week_rank, :plus_minus_view, :this_week_rank, :this_week_view, :time_since_upload, :total_aggregate_view, :video_name, :weeks_on_chart
  
  

  def get_top_videos
	client = YouTubeIt::Client.new(:dev_key => "AI39si74utp1SAhXpQ1Ib8cuM1TKS-yZybNqGBoYSeL4Hg0AQCjyq7jXn2dQea717_VPw8TC1SfHmZ2JOwpkuKLEA7aDg1tdcA")
  	videos = client.videos_by(:top_rated, :time => :this_week, :user => "CTFxC")
  end

  def save_videos(video)
  	@video = Video.find_or_create_by_video_id(video.video_id) do |v|
  		v.video_id = video.video_id
  		v.video_name = video.title
  		v.save
  	end
  end


end


