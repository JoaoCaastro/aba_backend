class CreateParentGuardians < ActiveRecord::Migration[7.0]
  def change
    create_table :parent_guardians do |t|
      t.string :parent_name
      t.string :cpf
      t.string :degree_of_kinship
      t.string :email
      t.string :telephone

      t.timestamps
    end
  end
end
