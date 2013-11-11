class User < ActiveRecord::Base

  has_secure_password

  validates_presence_of :user_name, :first_name, :last_name, :email
  validates_uniqueness_of :user_name, message: "%{value} has already been taken"
  validates_uniqueness_of :email, message: "%{value} is already registered"
  validates_format_of :email, with: /\A[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\Z/, on: :create, message: "format is not valid"
  validates_format_of :user_name, with: /\A[a-zA-Z0-9_-]+\Z/, message: "must be at least two characters long and can contain only letters, hyphens, numbers and underscores"
  validates_format_of :first_name, with: /\A[a-zA-Z. ]+\Z/, message: "can only contain letters, spaces and dots"
  validates_format_of :last_name, with: /\A[a-zA-Z. ]+\Z/, message: "can only contain letters, spaces and dots"

  validates_length_of :password, minimum: 6, message: "must be at least 6 characters long"
  validates_length_of :user_name, :first_name, :last_name, minimum: 2, message: "must be at least 2 characters long"



end
