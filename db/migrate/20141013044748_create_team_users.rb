class CreateTeamUsers < ActiveRecord::Migration
  def change
    create_table :team_users do |t|
      t.references :user
      t.references :team

      t.timestamps
    end
  end
end
