class VideosDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Video.count,
      iTotalDisplayRecords: videos.total_entries,
      aaData: data
    }
  end

private

  def data
    videos.map do |video|
      [
        h(video.this_week_rank),
        h(video.video_name),
        h(video.total_aggregate_view),
        h(video.time_since_upload)       
       
      ]
    end
  end

  def videos
    @videos ||= fetch_videos
  end

  def fetch_videos
    videos = Video.order("#{sort_column} #{sort_direction}")
    videos = videos.page(page).per_page(per_page)
    if params[:sSearch].present?
      videos = videos.where("video_name like :search", search: "%#{params[:sSearch]}%")
    end
    videos
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[this_week_rank released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end