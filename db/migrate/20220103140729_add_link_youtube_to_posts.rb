class AddLinkYoutubeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :youtube_link, :string
    add_column :posts, :blog_link, :string
    add_column :posts, :image, :binary, limit: 1.megabyte
    remove_column :posts, :link
    
  end
end
