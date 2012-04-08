class CreateGnarusExerciseAttempts < ActiveRecord::Migration
  def change
    create_table :gnarus_exercise_attempts do |t|
      t.references :exercise
      t.text :return_uri
      t.string :author_id

      t.timestamps
    end
    add_index :gnarus_exercise_attempts, :exercise_id
  end
end
