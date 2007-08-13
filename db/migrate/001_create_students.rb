class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :login
      t.string :password
      t.string :email

      t.timestamps 
    end
  end

  def self.down
    drop_table :students
  end
end
