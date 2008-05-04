class Student < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  validates_presence_of :login, :email
end