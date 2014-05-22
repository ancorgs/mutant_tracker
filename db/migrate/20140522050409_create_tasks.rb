class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.references :team
      t.integer :state_id, index: true

      t.timestamps
    end
    add_foreign_key(:tasks, :teams)
  end
end
