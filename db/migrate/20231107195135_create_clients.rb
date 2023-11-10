class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.date :brithday
      t.string :gender
      t.string :cpf
      t.string :telephone
      t.string :email
      t.string :education_level
      t.text :medical_informations
      t.text :medicines_in_use
      t.text :processing_information

      t.timestamps
    end
  end
end
