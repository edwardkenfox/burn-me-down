class RemoveIssueIdFromCharts < ActiveRecord::Migration
  def up
    remove_column :charts, :issue_id
  end

  def down
    add_column :charts, :issue_id, :integer
  end
end
