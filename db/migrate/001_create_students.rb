class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :login, :email, :identity_url
      t.timestamps 
    end
  end

  def self.down
    drop_table :students
  end
end
