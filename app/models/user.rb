class User < ActiveRecord::Base
  
  attr_accessor :password_confirmation
  
  default_scope order('name')
  
  validates_presence_of     :name
  validates_uniqueness_of   :name
  validates_confirmation_of :password
  validate                  :password_non_blank

  def role_symbols
    roles = [:user]
    if is_admin
      roles = [:admin]
    end
    roles
  end
  
  def self.authenticate(name, password)
    user = self.find_by_name(name)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end
  
  def to_s
    name
  end
  
  def password
    @password
  end
  
  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
  private
  
  def password_non_blank
    errors.add(:password, "Missing Password") if hashed_password.blank?
  end
  
  def self.encrypted_password(password, salt)
    string_to_hash = password + "alskjlsiu3280928kjas287oiu" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
end
