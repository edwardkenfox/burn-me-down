class CreateVelocities < ActiveRecord::Migration
  def change
    create_table :velocities do |t|
      t.references  :chart
      t.integer     :start_count
      t.integer     :end_count
      t.date        :start_at
      t.date        :end_at

      t.timestamps
    end
  end
end
