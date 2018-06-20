class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :author_name, :user_name
  end
end
