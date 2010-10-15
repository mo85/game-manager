class PlayerCount < ActiveRecord::Base
  
  has_and_belongs_to_many :games

  def to_s
    s = ""
    case self.count
    when 2 then s = "zwei"
    when 3 then s = "drei"
    when 4 then s = "vier"
    when 12 then s = "ein Duzend"
    when 36 then s = "mehrere Duzend"
    end
  end
  
end
