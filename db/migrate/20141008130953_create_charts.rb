class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :name
      t.references :issue
      t.references :velocity

      t.timestamps
    end

    add_index :charts, :name
  end
end
