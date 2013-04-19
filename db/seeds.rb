# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
User.create([
  { email: 'foo@example.com', password: 'foopassword' },
  { email: 'bar@example.com', password: 'barpassword' }
])
News.create([
  { title: 'Profesorka priznala da je snimala seks sa svojim ucenicima', url: 'http://www.blic.rs/Vesti/Svet/377702/Profesorka-priznala-da-je-snimala-seks-sa-svojim-ucenicima', domain: 'blic.rs', points: 10},
  { title: 'Neka kul ves, bez naslova', url: 'http://sport.blic.rs/Kosarka/Domaca-kosarka-i-ABA/231538/Nova-sokterapija-u-Zvezdi-Dejan-Radonjic-preuzima-crvenobele' , domain: 'sport.blic.rs' },
  { title: 'Novi samar Radnickom, Vojvodina nanela treci uzastopni poraz Kragujevcanima!', url: 'http://sport.blic.rs/Kosarka/Domaca-kosarka-i-ABA/231544/Novi-samar-Radnickom-Vojvodina-nanela-treci-uzastopni-poraz-Kragujevcanima', domain: 'sport.blic.rs', points: 24 },
  { title: 'Trika novi trener Kluza', url: 'http://sport.blic.rs/Fudbal/Evropski-fudbal/231535/Trika-novi-trener-Kluza', domain: 'sport.blic.rs', points: 14 },
  { title: 'Umro legendarni Kermali, trener koji je doneo jedini Africki kup nacija Alziru', url: 'http://sport.blic.rs/Fudbal/Svetski-fudbal/231528/Umro-legendarni-Kermali-trener-koji-je-doneo-jedini-Africki-kup-nacija-Alziru', domain: 'sport.blic.rs', points: 38 }
])
