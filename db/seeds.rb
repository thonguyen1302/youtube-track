# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Playlist.delete_all
Playlist.create(this_week_rank: 12, last_week_rank: 12, playlist_name: 'abc', total_aggregate_views: 123)


 