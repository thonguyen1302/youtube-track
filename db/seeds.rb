# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Average.delete_all
Average.create(average_view: 812646, created_at: "2012-11-7 14:33:05")
Average.create(average_view: 822646, created_at: "2012-11-8 14:33:05")
Average.create(average_view: 792646, created_at: "2012-11-9 14:33:05")
Average.create(average_view: 822646, created_at: "2012-11-10 14:33:05")
Average.create(average_view: 802646, created_at: "2012-11-11 14:33:05")
Average.create(average_view: 832646, created_at: "2012-11-12 14:33:05")

 