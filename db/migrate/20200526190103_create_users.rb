class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :uid
      t.string :provider
      t.text :bio
      t.text :quote
      t.timestamps
    end
  end
end
