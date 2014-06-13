class Upload < ActiveRecord::Base
  
  belongs_to :party
  belongs_to :sound
  
  #scope :contributed_to,   lambda { |party_id| where("#{table_name}.party_id = ?", party_id) }
  
end
