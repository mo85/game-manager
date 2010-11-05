if false
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
end

users = User.create([
  { :name => "mark.odermatt", 
    :is_admin => true,
    :salt => "aslkocuojaelk920oiu",
    :hashed_password => User.encrypted_password("secret", "aslkocuojaelk920oiu") },
  { :name => "anina.dirnberger", 
    :is_admin => true, 
    :salt => "iu0q3lk09klajedoiulkos",
    :hashed_password => User.encrypted_password("secret", "iu0q3lk09klajedoiulkos")}
])