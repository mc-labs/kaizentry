class User < ActiveRecord::Base
  has_many :kaizens, -> { order "created_at DESC"}
  validates :email, uniqueness: true, presence: true
end
