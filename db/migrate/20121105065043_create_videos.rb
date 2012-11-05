class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :this_week_rank
      t.integer :last_week_rank
      t.string :video_name
      t.integer :weeks_on_chart
      t.integer :total_aggregate_view
      t.integer :this_week_view
      t.integer :plus_minus_view
      t.integer :time_since_upload

      t.timestamps
    end
  end
end
