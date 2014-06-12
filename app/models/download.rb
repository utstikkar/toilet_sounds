class Download < ActiveRecord::Base
  
  belongs_to :party
  belongs_to :sound
  
end
