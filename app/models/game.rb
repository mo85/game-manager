class Game < ActiveRecord::Base
  
  default_scope order('name')

  ::LOCATIONS = { 0 => "draussen", 1 => "drinnen", 2 => "unterwegs" }
  ::INTENSITY_LEVELS = { 0 => "gemaessigt", 1 => "aktiv", 2 => "sehr aktiv" }
  ::NUMBER_OF_PLAYERS = { 0 => "zwei", 1 => "drei", 2 => "vier", 3 => "ein Duzend", 4 => "mehrere Duzend" }
  ::FORM = { 0 => "alle miteinander", 1 => "alle gegen alle", 2 => "alle gegen einen", 3 => "Mannschaften gegeineinander" }
  
  
  def location_to_s
    ::LOCATIONS[self.location]
  end
  
  def players_to_s
    ::NUMBER_OF_PLAYERS[self.players]
  end
  
  def form_to_s
    ::FORM[self.form]
  end

  def to_s
    self.name
  end
  
end
