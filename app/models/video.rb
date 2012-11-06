class Video < ActiveRecord::Base
  attr_accessible :video_id,:last_week_rank, :plus_minus_view, :this_week_rank, :this_week_view, :time_since_upload, :total_aggregate_view, :video_name, :weeks_on_chart
  
  

  def get_top_videos
	
	client = YouTubeIt::Client.new(:dev_key => "AI39si74utp1SAhXpQ1Ib8cuM1TKS-yZybNqGBoYSeL4Hg0AQCjyq7jXn2dQea717_VPw8TC1SfHmZ2JOwpkuKLEA7aDg1tdcA")
  	videos = client.videos_by(:user => "TheEllenShow", :top_rated => 10, :time => :this_week)

  end

   
   def save_videos(video, temp)
   		
		if Video.exists?(["video_id = ?", video.video_id])
		  object = Video.find_by_video_id(video.video_id)
		  object.update_attributes!( 
		  	:video_id => video.video_id,
		    :video_name => video.title,
		    :this_week_rank => temp,
		    :total_aggregate_view => video.view_count,
		    :time_since_upload => ((DateTime.now.to_date - video.uploaded_at.to_date)/7).to_f.round(0))
			  	
		else
		  Video.create! :video_id => video.video_id,
		    :video_name => video.title,
		    :this_week_rank => temp,
		    :this_week_view => video.view_count,
		    :time_since_upload => ((DateTime.now.to_date - video.uploaded_at.to_date)/7).to_f.round(0)
		end
	end
   
end