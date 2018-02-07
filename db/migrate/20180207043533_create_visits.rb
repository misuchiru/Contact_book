class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.datetime :visit_time
      t.text :description
      t.string :visitors
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
