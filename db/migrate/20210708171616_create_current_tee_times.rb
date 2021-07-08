class CreateCurrentTeeTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :current_tee_times do |t|
      t.string :location
      t.date :date
      t.time :time
      t.integer :openSpots
      t.string :host
      t.text :players
      t.text :invitees
      t.boolean :private
    end
  end
end
