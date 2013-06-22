class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :name
      t.integer :identification
      t.boolean :assimilated

      t.timestamps
    end
  end
end
