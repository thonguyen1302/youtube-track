# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Video.delete_all
Video.create(this_week_rank: 12, last_week_rank: 12, time_since_upload: '2012-11-07 03:44:31', video_name: 'abc', total_aggregate_view: 123)


 