class CreateGroupToPeople < ActiveRecord::Migration
  def self.up
    create_table :groups_people do |t|
      t.belongs_to :student, index: true
      t.belongs_to :group, index: true
    end
  end
  def self.down
    drop_table :groups_to_people
  end
end
