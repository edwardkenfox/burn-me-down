class AddTeamIdToCharts < ActiveRecord::Migration
  def change
    add_column :charts, :team_id, :integer, null: false

    add_index :charts, :team_id
  end
end
