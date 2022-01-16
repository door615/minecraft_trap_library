class RemovePasswordFromAuth < ActiveRecord::Migration[6.1]
  def change
    remove_column :auths, :password
    add_column :auths, :password_digest, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
