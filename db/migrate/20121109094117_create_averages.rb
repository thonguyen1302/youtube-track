class CreateAverages < ActiveRecord::Migration
  def change
    create_table :averages do |t|
      t.integer :average_view

      t.timestamps
    end
  end
end
