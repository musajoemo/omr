# *** One user profile
class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name 
  #belongs_to :user, :user_id
  belongs_to :user
end
