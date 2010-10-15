class Game < ActiveRecord::Base
  
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :player_counts
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :contents
  
  validates_presence_of :name
  
  default_scope order('name')

  ::INTENSITY_LEVELS = { 0 => "gemaessigt", 1 => "aktiv", 2 => "sehr aktiv" }
  ::FORM = { 0 => "alle miteinander", 1 => "alle gegen alle", 2 => "alle gegen einen", 3 => "Mannschaften gegeineinander" }
  
  def form_to_s
    ::FORM[self.form]
  end

  def to_s
    self.name
  end
  
end
