class CreateSumneHanges < ActiveRecord::Migration
  def up
    create_table :sumne_hanges do |t|

      t.timestamps
    end
  end

  def down
  	drop_table :sumne_hanges
  end
end
