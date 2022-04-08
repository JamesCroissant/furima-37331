class RemoveSellerFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :seller, :text
  end
end
