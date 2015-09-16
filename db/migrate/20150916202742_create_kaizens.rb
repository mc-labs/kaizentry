class CreateKaizens < ActiveRecord::Migration
  def change
    create_table :kaizens do |t|
      t.text :text

      t.timestamps null: false
    end
  end
end
