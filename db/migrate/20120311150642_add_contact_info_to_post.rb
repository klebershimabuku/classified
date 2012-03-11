class AddContactInfoToPost < ActiveRecord::Migration
  def change
    add_column :posts, :contact_info, :string

  end
end
