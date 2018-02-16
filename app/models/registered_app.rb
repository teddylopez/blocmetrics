class RegisteredApp < ActiveRecord::Base
  belongs_to :user
  has_many :events
  validates :name, :presence => true, :uniqueness => true
  validates :url, :presence => true
end
