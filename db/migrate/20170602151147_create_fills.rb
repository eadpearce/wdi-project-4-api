class CreateFills < ActiveRecord::Migration[5.1]
  def change
    create_table :fills do |t|
      t.references :prompt, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
