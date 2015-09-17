require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "attributes are present" do
    user = User.new
    assert user.invalid?
  end

  test "email is unique" do
    user = User.new(email: "dhackett")
    assert user.invalid?
    user.email = "dmatheson"
    assert user.valid?
  end
end
