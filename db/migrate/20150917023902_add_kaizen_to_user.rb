class AddKaizenToUser < ActiveRecord::Migration
  def change
    add_reference :kaizens, :user, index: true
  end
end
