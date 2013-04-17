class AddColumnReferenceToStepsTable < ActiveRecord::Migration
   def change
    add_column :steps, :reference, :string
  end
end
