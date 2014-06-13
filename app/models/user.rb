class User < ActiveRecord::Base
  
  has_many :sounds, :dependent => :destroy
  
end
