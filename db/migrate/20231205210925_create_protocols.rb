class CreateProtocols < ActiveRecord::Migration[7.0]
  def change
    create_table :protocols do |t|
      t.string :name
      t.boolean :status
      t.belongs_to :client, foreign_key: true

      t.timestamps
    end
  end
end
