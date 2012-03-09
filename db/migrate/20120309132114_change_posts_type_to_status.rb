class ChangePostsTypeToStatus < ActiveRecord::Migration
  def up
    add_column :posts, :status, :string, :default => 'pending'
    remove_column :posts, :type
  end

  def down
    remove_column :posts, :status
  end
end
