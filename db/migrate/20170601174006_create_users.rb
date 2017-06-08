class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.text :image, :default => '/images/cage.jpeg'
      t.string :password_digest
      t.text :about

      t.timestamps
    end
  end
end
