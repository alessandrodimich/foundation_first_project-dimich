class Event < ActiveRecord::Base
  belongs_to :user

  validates :user, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true


end
