class CreateGnarusExerciseExecutions < ActiveRecord::Migration
  def change
    create_table :gnarus_activity_executions do |t|
      t.references :attempt
      t.text :solution
      t.boolean :suceeded

      t.timestamps
    end
    add_index :gnarus_activity_executions, :attempt_id
  end
end
