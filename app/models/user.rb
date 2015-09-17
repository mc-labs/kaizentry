class User < ActiveRecord::Base
  has_many :kaizens
  validates :email, uniqueness: true, presence: true
end
