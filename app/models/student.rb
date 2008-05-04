class Student < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  
  def self.signup(params)
    self.create(params)
  end
  
end