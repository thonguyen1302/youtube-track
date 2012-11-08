class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :this_week_rank
      t.string :playlist_name
      t.integer :total_aggregate_views
      t.integer :this_week_views
      t.integer :weekly_view
      t.integer :video_in_series
      t.integer :last_week_rank
      t.integer :comments
      t.integer :shares

      t.timestamps
    end
  end
end
