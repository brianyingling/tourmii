class AddIsCompleteAttributeToStepTable < ActiveRecord::Migration
  def change
    add_column :steps, :is_complete, :boolean, :default => false
  end
end
