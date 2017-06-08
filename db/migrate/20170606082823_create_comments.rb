class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :fill, foreign_key: true
      t.references :prompt, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :anon

      t.timestamps
    end
  end
end
