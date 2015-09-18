class Kaizen < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user
  validates :text, presence: true
  def tag_list
    self.tags.map {|t| t.name}.join(',')
  end
  def tag_list=(new_value)
    tag_names = new_value.strip.split(/ *, */)
    self.tags = tag_names.map { |name| Tag.where('name = ?', name).first or Tag.create(:name => name) }
  end
end
