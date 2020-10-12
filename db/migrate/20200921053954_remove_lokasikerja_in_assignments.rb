class RemoveLokasikerjaInAssignments < ActiveRecord::Migration[5.2]
  def change
    remove_column :assignments, :lokasi_kerja
  end
end
