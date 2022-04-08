class RenameUserIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :user_id, :scheduled_day_id
  end
end
