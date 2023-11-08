class CreateClientesParentGuardians < ActiveRecord::Migration[7.0]
  def change
    create_table :clientes_parent_guardians do |t|
      t.references :cliente, foreign_key: true
      t.references :parent_guardian, foreign_key: true

      t.timestamps
    end
  end
end
