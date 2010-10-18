class Content < ActiveRecord::Base

  has_and_belongs_to_many :games

  def to_s
    name
  end
end
