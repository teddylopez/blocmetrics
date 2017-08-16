class Registration < ActiveRecord::Base
  belongs_to :user
  validates :name, :presence => true, :uniqueness => true
  validates :url, :presence => true
end
