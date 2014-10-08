class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :url
      t.integer :open
      t.references :chart

      t.timestamps
    end
  end
end
