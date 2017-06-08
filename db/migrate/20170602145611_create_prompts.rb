class CreatePrompts < ActiveRecord::Migration[5.1]
  def change
    create_table :prompts do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true
      t.text :tagged_as
      t.boolean :anon

      t.timestamps
    end
  end
end
