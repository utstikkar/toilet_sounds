class User < ActiveRecord::Base
  
  has_many :sounds, :dependent => :destroy
  has_many :uploads, :dependent => :destroy
  has_many :downloads, :dependent => :destroy
  
end
