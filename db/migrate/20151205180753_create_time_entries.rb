class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.float :spent_hours
      t.float :estimate_hours

      t.timestamps null: false
    end
  end
end
