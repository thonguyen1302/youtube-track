class Video < ActiveRecord::Base
  attr_accessible :video_id,:last_week_rank, :plus_minus_view, :this_week_rank, :this_week_view, :time_since_upload, :total_aggregate_view, :video_name, :weeks_on_chart
  
  def get_top_videos
		client = YouTubeIt::Client.new(:dev_key => "AI39si74utp1SAhXpQ1Ib8cuM1TKS-yZybNqGBoYSeL4Hg0AQCjyq7jXn2dQea717_VPw8TC1SfHmZ2JOwpkuKLEA7aDg1tdcA")
		videos = client.videos_by(:user => "TheEllenShow", :top_rated => 25, :time => :this_week)
  end

  def get_top_playlists
		client = YouTubeIt::Client.new(:dev_key => "AI39si74utp1SAhXpQ1Ib8cuM1TKS-yZybNqGBoYSeL4Hg0AQCjyq7jXn2dQea717_VPw8TC1SfHmZ2JOwpkuKLEA7aDg1tdcA")
		playlists = client.playlists("TheEllenShow")
  end

  def get_videos_of_playlists(playlist_id)
		client = YouTubeIt::Client.new(:dev_key => "AI39si74utp1SAhXpQ1Ib8cuM1TKS-yZybNqGBoYSeL4Hg0AQCjyq7jXn2dQea717_VPw8TC1SfHmZ2JOwpkuKLEA7aDg1tdcA")
		playlists = client.playlist(playlist_id)
		playlists.videos
  end


  def save_videos(video, temp)
		if Video.exists?(["video_id = ? and this_week_rank = ?", video.video_id, temp])
		  clip = Video.find_by_video_id(video.video_id)
		  view_c = clip.this_week_view
		  if (clip.total_aggregate_view < video.view_count)
		  	view_c = (video.view_count-(clip.total_aggregate_view))+view_c
		  end
		  last_week_r = clip.this_week_rank
			  clip.update_attributes!( 
			  	:video_id => video.video_id,
			    :video_name => video.title,
			    :this_week_rank => temp,
			    :last_week_rank => last_week_r,
			    :this_week_view => view_c,
			    :total_aggregate_view => video.view_count,
			  	:time_since_upload => video.uploaded_at)
		else
			if Video.exists?(["video_id = ?", video.video_id])
			  clip = Video.find_by_video_id(video.video_id)
			  view_c = clip.this_week_view
			  if (clip.total_aggregate_view<video.view_count)
			  	view_c = (video.view_count-(clip.total_aggregate_view))+view_c
			  end
			  last_week_r = clip.this_week_rank
			  clip.update_attributes!(
				  	:video_id => video.video_id,
				    :video_name => video.title,
				    :this_week_rank => temp,
				    :last_week_rank => last_week_r,
				    :this_week_view => view_c,
				    :total_aggregate_view => video.view_count,		    
				  	:time_since_upload => video.uploaded_at)
			else
				if Video.exists?(["this_week_rank = ?", temp])
					Video.delete_all(["this_week_rank = ?", temp])
					Video.create! :video_id => video.video_id,
				    :video_name => video.title,
				    :this_week_rank => temp,
				    :last_week_rank => 0,
				    :total_aggregate_view => video.view_count,
				    :this_week_view => 0,
				    :time_since_upload => video.uploaded_at
			  else
				  	Video.create! :video_id => video.video_id,
				    :video_name => video.title,
				    :this_week_rank => temp,
				    :last_week_rank => 0,
				    :total_aggregate_view => video.view_count,
				    :this_week_view => 0,
				    :time_since_upload => video.uploaded_at
			  end
			end
		end
	end
end