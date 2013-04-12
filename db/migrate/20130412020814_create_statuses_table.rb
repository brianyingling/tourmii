class CreateStatusesTable < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer       :step_id
      t.integer       :user_id
      t.boolean       :is_complete
      t.timestamps
    end
  end
end
