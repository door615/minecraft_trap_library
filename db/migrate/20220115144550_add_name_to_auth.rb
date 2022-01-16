class AddNameToAuth < ActiveRecord::Migration[6.1]
  def change
    add_column :auths, :name, :string
  end
end
