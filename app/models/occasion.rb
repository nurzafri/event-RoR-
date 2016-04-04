class Occasion < ActiveRecord::Base
  validates :organization, presence: true
  validates :user, presence: true
  validates :name, presence: true
  belongs_to :organization
  belongs_to :user
end
