class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :alpha2
      t.string :alpha3
      t.boolean :active, :default => true
      t.timestamps
    end
  end
end
