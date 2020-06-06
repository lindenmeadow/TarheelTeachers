class CreateForums < ActiveRecord::Migration[6.0]
  def change
    create_table :forums do |t|
      t.string :forum_name
      t.integer :discussion_id
      t.timestamps
    end
  end
end
