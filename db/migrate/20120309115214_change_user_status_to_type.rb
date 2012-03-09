class ChangeUserStatusToType < ActiveRecord::Migration
  def up
    add_column :posts, :type, :string, :default => 'Pending'
  end

  def down
    remove_column :posts, :status
  end
end
