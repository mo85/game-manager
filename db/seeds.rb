# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

locations = Location.create( [ 
  { :description => "drinnen" }, 
  { :description => "draussen" }, 
  { :description => "unterwegs" }]
)
player_counts = PlayerCount.create([
  { :count => 2 }, { :count => 3 }, 
  { :count => 4 }, { :count => 12 }, { :count => 36 }
])

categories = Category.create([ { :name => "Kreisspiel" }, { :name => "Tischspiel" },
   { :name => "Assoziationsspiel"}, { :name => "Sprachspiel" }, { :name => "Kennenlernspiel"},
   { :name => "Singspiel" }, { :name => "Ballspiel" }, { :name => "Fangen" },
   { :name => "Sinnesspiel" }, { :name => "andere" } ]
)

contents = Content.create([ { :name => "darstellen" }, { :name => "fantasieren" },
  { :name => "assoziieren" }, { :name => "bewegen" }, { :name => "vertrauen" },
  { :name => "gestalten" }, { :name => "wahrnehmen" }, { :name => "anregen" },
  { :name => "konzentrieren" }, { :name => "entspannen" }, { :name => "hoeren-sehen-spueren" } ]
)