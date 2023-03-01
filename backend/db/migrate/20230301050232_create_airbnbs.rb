class CreateAirbnbs < ActiveRecord::Migration[6.1]
  def change

    create_table :airbnbs do |t|
      t.string :name
      t.string :location
      t.integer :size
      t.integer :price
      t.references :host, null: false, foreign_key: true

      t.timestamps
    end

  end
end