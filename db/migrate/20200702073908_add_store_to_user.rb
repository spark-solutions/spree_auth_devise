class AddStoreToUser < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:spree_users, :store_id)
      add_column :spree_users, :store_id, :integer
    end
  end
end
