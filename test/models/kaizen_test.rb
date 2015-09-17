require 'test_helper'

class KaizenTest < ActiveSupport::TestCase
  test "lack of kaizen text is invalid" do
    kaizen = Kaizen.new
    assert kaizen.invalid?
  end

  test "presence of kaizen text is valid" do
    kaizen = Kaizen.new(text: "I love kaizens")
    assert kaizen.valid?
  end
end
