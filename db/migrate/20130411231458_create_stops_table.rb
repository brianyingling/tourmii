class CreateStopsTable < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string              :name
      t.text                :description
      t.string              :address
      t.integer             :lat
      t.integer             :lng
      t.string              :audiofile
      t.integer             :position
      t.integer             :tour_id
      t.timestamps
    end
  end
end
