class Location < ActiveRecord::Base
  
  has_and_belongs_to_many :games
  
  validates_presence_of :description

  def to_s
    description
  end

end
