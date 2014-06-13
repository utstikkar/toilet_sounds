class Sound < ActiveRecord::Base
  
  belongs_to :user
  has_many :downloads
  has_many :uploads
  has_many :parties, :through => :downloads
  has_many :parties, :through => :uploads
  
end
