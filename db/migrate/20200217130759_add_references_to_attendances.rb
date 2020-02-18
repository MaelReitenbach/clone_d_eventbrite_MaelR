class AddReferencesToAttendances < ActiveRecord::Migration[5.2]
  def change
    change_table(:attendances) do |t|
      t.references :user, index: true
      t.references :event, index: true
    end
  end
end
