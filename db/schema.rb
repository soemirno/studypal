# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 1) do

  create_table "students", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "identity_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
