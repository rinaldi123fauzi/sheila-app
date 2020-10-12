class AddColumnUserMengajukanToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :user_mengajukan, :integer
  end
end
