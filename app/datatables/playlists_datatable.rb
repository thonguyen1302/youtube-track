class PlaylistsDatatable
  
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Playlist.count,
      iTotalDisplayRecords: playlists.total_entries,
      aaData: data
    }
  end

private
  def data
    playlists.map do |playlist|
      [
        h(playlist.this_week_rank),
        if (playlist.last_week_rank==0)
          h("New playlist")
        else
          h(playlist.last_week_rank)
        end,
        h(playlist.playlist_name),
        h(playlist.total_aggregate_views),
        h(playlist.this_week_views),
        h(playlist.video_in_series),
        h(playlist.comments)

      
        
      ]
    end
  end

  def playlists
    @playlists ||= fetch_playlists
  end

  def fetch_playlists
    playlists = Playlist.order("#{sort_column} #{sort_direction}")
    playlists = playlists.page(page).per_page(per_page)
    if params[:sSearch].present?
      playlists = playlists.where("playlist_name like :search", search: "%#{params[:sSearch]}%")
    end
    playlists
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[this_week_rank]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end