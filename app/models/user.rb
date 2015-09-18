class User < ActiveRecord::Base
  has_many :kaizens, -> { order "created_at DESC"}
  validates :email, uniqueness: true, presence: true, length: {maximum: 64}
  validates :email, format: { with: /[\w{.,'}+:?-]+/i, on: :create }
  before_save { |kaizen| kaizen.email = kaizen.email.downcase }

  def change_email
    self.email
  end

  def change_email=(new_value)
    unless self.email == "anonymous"
      self.email = new_value
    end
  end
end
