class Deletetableinfoapprove < ActiveRecord::Migration[5.2]
  def change
    drop_table :info_approves
  end
end
