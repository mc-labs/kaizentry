require 'test_helper'

class TagTest < ActiveSupport::TestCase
  test "presenece of tag name" do
    tag = Tag.new
    assert tag.invalid?
  end

  test "uniqueness of tag name" do
    tag = Tag.new(name: "windows")
    assert tag.invalid?
    tag.name = "linux"
    assert tag.valid?
  end
end
