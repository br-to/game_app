class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id, index: true
      t.integer :micropost_id,index: true

      t.timestamps
    end
  end
end
