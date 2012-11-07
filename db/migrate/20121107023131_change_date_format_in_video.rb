class ChangeDateFormatInVideo < ActiveRecord::Migration
  def up
  	change_column :videos, :time_since_upload, :datetime
  end

  def down
  	change_column :videos, :time_since_upload, :string
  end
end
