class Student < ActiveRecord::Base
  validates_confirmation_of :password
end
