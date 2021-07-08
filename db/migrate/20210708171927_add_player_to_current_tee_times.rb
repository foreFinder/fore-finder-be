class AddPlayerToCurrentTeeTimes < ActiveRecord::Migration[5.2]
  def change
    add_reference :current_tee_times, :player, foreign_key: true
  end
end
