class AddSeveralOtherColumnsToPost < ActiveRecord::Migration
  def up
    add_column :posts, :prefecture, :string
    add_column :posts, :year, :integer
    add_column :posts, :shaken_validation, :string
    add_column :posts, :makes, :string
    add_column :posts, :model, :string
    add_column :posts, :displacement, :string
    add_column :posts, :mileage, :integer
    add_column :posts, :engine, :string
    add_column :posts, :transmission, :string
    add_column :posts, :fuel, :string
  end

  def down
    remove_column :posts, :prefecture, :string
    remove_column :posts, :year, :integer
    remove_column :posts, :shaken_validation, :string
    remove_column :posts, :makes, :string
    remove_column :posts, :model, :string
    remove_column :posts, :displacement, :string
    remove_column :posts, :mileage, :integer
    remove_column :posts, :engine, :string
    remove_column :posts, :transmission, :string
    remove_column :posts, :fuel, :string
  end
end
