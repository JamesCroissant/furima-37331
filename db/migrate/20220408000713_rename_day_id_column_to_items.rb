class RenameDayIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :day_id, :scheduled_day_id
  end
end
