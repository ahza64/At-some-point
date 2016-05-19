class Task < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :location, presence: true
end
