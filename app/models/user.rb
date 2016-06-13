class User < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :email, :password, :username
  validates_uniqueness_of :email, :username

end