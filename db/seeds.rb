# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Comic.destroy_all
Company.destroy_all
User.destroy_all

company1 = Company.create(name: 'Marvel Comics', year_founded: 1939, logo_url: 'http://img2.wikia.nocookie.net/__cb20140701230531/logopedia/images/a/a8/Marvel-logo.png')
company2 = Company.create(name: 'Image Comics', year_founded: 1992, logo_url: 'http://blog.midtowncomics.com/wp-content/uploads/2014/06/image.png')
company3 = Company.create(name: 'Other')
company4 = Company.create(name: 'DC Comics', year_founded: 1934, logo_url: 'http://img1.wikia.nocookie.net/__cb20130913230115/batman/es/images/1/1c/DC_Comics_logo.png')
company5 = Company.create(name: 'Dark Horse Comics', year_founded: 1986, logo_url: 'http://upload.wikimedia.org/wikipedia/en/thumb/f/f8/Dark_Horse_Comics_logo.svg/200px-Dark_Horse_Comics_logo.svg.png')
company6 = Company.create(name: 'Top Cow Productions', year_founded: 1992, logo_url: 'http://cdn.bleedingcool.net/wp-content/uploads/2012/07/top-cow-logo.jpg')
company7 = Company.create(name: 'IDW Publishing', year_founded: 1999, logo_url: 'http://media.comicbook.com/wp-content/uploads/2013/10/IDW-banner.jpg')
user1 = User.create(email: 'blah@blah.com', password: '12345678', username: 'UserTest')
ownership1 = Ownership.create(user_id: 1, comic_id: 1, location: "home", note: "woo Mighty Avengers")
comic1 = Comic.create(series: "Mighty Avengers", number: 1, year: 2013, creators: "Al Ewing", company_id: 1, cover_img_url: "http://img3.wikia.nocookie.net/__cb20130607173134/marveldatabase/images/a/ad/Mighty_Avengers_Vol_2_1.jpg", )
comic2 = Comic.create(series: 'Guardians of the Galaxy', number: 1, year: 2008, creators: 'Dan Abnett', company_id: 1, date_published: '12/08/2008', cover_img_url: 'http://multiversitystatic.s3.amazonaws.com/uploads/2014/06/guardians08-1.jpg')
