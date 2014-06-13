class Download < ActiveRecord::Base
  
  belongs_to :party
  belongs_to :sound
  
  scope :used_at,   lambda { |party_id| where("#{table_name}.party_id = ?", party_id) }
  
end
