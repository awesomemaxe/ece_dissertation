class CreateDissTrackers < ActiveRecord::Migration
  def change
    create_table :diss_trackers do |t|
      t.string :UID
      t.string :last_name
      t.string :first_name
      t.string :titile
      t.string :chair
      t.string :advisor
      t.string :reader2
      t.string :reader3
      t.string :reader4
      t.string :reader5
      t.date :data_approved

      t.timestamps
    end
  end
end
