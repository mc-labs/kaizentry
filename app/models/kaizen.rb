class Kaizen < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user
  validates :text, presence: true
end
