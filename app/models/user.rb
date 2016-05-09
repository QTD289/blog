class User < ActiveRecord::Base
  has_many :articles
  has_many :comments
  
  has_secure_password
  
  validates :name, uniqueness: {case_sensitive: false}
end
