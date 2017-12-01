class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :cell_phone
      t.string :phone
      t.references :district, foreign_key: true

      t.timestamps
    end
  end
end
