class Party < ActiveRecord::Base
  
  has_many :downloads
  has_many :uploads
  has_many :sounds, :through => :downloads
  has_many :sounds, :through => :uploads
  
end
