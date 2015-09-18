class Tag < ActiveRecord::Base
  has_and_belongs_to_many :kaizens
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  before_save { |tag| tag.name = tag.name.downcase }
end
