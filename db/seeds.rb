# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



comic1 = Comic.create(title: 'Guardians of the Galaxy', number: 1, creators: 'Dan Abnett', date_published: '12/08/2008', year: 2008, series: 'Guardians of the Galaxy' , cover_img_url: 'http://multiversitystatic.s3.amazonaws.com/uploads/2014/06/guardians08-1.jpg')
company1 = Company.create(name: 'Marvel Comics', year_founded: 1939, logo_url: 'http://img2.wikia.nocookie.net/__cb20140701230531/logopedia/images/a/a8/Marvel-logo.png')
