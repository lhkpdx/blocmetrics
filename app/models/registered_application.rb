class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  validates :url, :url => true
end
