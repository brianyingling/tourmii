class CreateToursTable < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string            :name
      t.text              :description
      t.float             :lat
      t.float             :lng
      t.string            :image
      t.decimal           :price
      t.integer           :user_id
      t.timestamps
    end
  end
end
