class Team < ActiveRecord::Base
  has_many :drivers
  has_secure_password
end
