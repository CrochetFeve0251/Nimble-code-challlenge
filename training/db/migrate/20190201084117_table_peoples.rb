class TablePeoples < ActiveRecord::Migration
  def change
    create_table :peoples

    add_column :peoples, :firstname, :string
    add_column :peoples, :lastname, :string
    add_column :peoples, :login, :string
    add_column :peoples, :password, :string
    add_column :peoples, :citizen_id, :integer
  end
end
