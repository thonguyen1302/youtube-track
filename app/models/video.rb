class Video < ActiveRecord::Base
  attr_accessible :video_id,:last_week_rank, :plus_minus_view, :this_week_rank, :this_week_view, :time_since_upload, :total_aggregate_view, :video_name, :weeks_on_chart
  
  

  def get_top_videos
	
	client = YouTubeIt::Client.new(:dev_key => "AI39si74utp1SAhXpQ1Ib8cuM1TKS-yZybNqGBoYSeL4Hg0AQCjyq7jXn2dQea717_VPw8TC1SfHmZ2JOwpkuKLEA7aDg1tdcA")
  	videos = client.videos_by(:user => "TheEllenShow", :top_rated => 10, :time => :this_week)

  end

   
   def save_videos(video, temp)
		if Video.exists?(["video_id = ?", video.video_id])
		  clip = Video.find_by_video_id(video.video_id)
		  clip.update_attributes!( 
		  	:video_id => video.video_id,
		    :video_name => video.title,
		    :this_week_rank => temp,
		    :this_week_view => video.view_count-(clip.total_aggregate_view),
		    :total_aggregate_view => video.view_count,		    
		  	:time_since_upload => video.uploaded_at)
		else
		  Video.create! :video_id => video.video_id,
		    :video_name => video.title,
		    :this_week_rank => temp,
		    :this_week_view => video.view_count-(clip.total_aggregate_view),
		    :total_aggregate_view => video.view_count,
		    :time_since_upload => video.uploaded_at
		end
	end
   
end