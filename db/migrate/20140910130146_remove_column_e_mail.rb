class RemoveColumnEMail < ActiveRecord::Migration
  def up
  #	remove_column "admin_users", "E-mail"
  	add_column "admin_users", "email", :string, :limit => 100, :null => false, :after => "last_name"
  end

  def down
  	remove_column "admin_users", "email"
  	add_column "admin-users", "E-mail", :string, :limit => 100, :null => false, :after => "last_name"
  end
end
