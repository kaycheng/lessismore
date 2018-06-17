class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :intro, :text
    add_column :users, :photo, :string
    add_column :users, :slogan, :string
  end
end
