class CreateGnarusExerciseAttempts < ActiveRecord::Migration
  def change
    create_table :gnarus_activity_attempts do |t|
      t.references :exercise
      t.text :return_uri
      t.string :author_id

      t.timestamps
    end
    add_index :gnarus_activity_attempts, :exercise_id
  end
end
