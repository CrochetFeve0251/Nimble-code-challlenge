class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.integer :mark, null: true
      t.string :subject
      t.text :work, null: true
      t.timestamps null: false
      t.belongs_to :course, index: true
    end
  end
  def self.down
    drop_table :groups
  end
end
