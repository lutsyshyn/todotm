class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :subject
      t.text :body
      t.integer :user_id
      t.boolean :shared, default: false

      t.timestamps
    end
  end
end
