class AddPriorityNumberToTags < ActiveRecord::Migration[6.1]
  def change
    add_column :tags, :priority_number, :int
  end
end
