class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.column "first_name", :string, :limit => 50
    	t.string "last_name", :limit => 50
    	t.string "E-mail", :limit => 15, :default => "", :null => false
    	t.string "Password", :limit => 40
		t.timestamps
    end
  end

  def down
  	drop_table :users
  end
end
