class CreateOrdersTable < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer     :tour_id
      t.integer     :user_id
      t.date        :date_purchased
      t.timestamps
    end
  end
end
