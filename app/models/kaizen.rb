class Kaizen < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user
  validates :text, presence: true

  searchable do
    text :text
  end

  def tag_list
    self.tags.map {|t| t.name}.join(',')
  end

  def tag_list=(new_value)
    tag_names = new_value.strip.split(/ *, */)
    self.tags = tag_names.map { |name| Tag.where('name = ?', name).first or Tag.create(name: name) }
  end

  def user_email
    if self.user.nil?
      ""
    else
      self.user.email
    end
  end

  def user_email=(new_value)
    if new_value.strip.empty?
      new_email = "anonymous"
    else
      new_email = new_value
    end
    self.user = (User.where('email = ?', new_email).first or User.create(email: new_email))
  end

  def update_user_email=(new_value)
    current_user = self.user
    if current_user.nil?
      self.user = User.create(email: new_value)
    end
  end
end
