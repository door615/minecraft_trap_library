class CreateAuths < ActiveRecord::Migration[6.1]
  def change
    create_table :auths do |t|
      t.string :password

      t.timestamps
    end
  end
end
