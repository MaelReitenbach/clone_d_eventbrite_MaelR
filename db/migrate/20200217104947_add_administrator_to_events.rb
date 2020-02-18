class AddAdministratorToEvents < ActiveRecord::Migration[5.2]
  def change
    change_table(:events) do |t|
      t.references :administrator, index: true
    end
  end
end
