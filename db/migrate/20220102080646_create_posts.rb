class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.text :feature_text
      t.text :text

      t.timestamps
    end
  end
end
