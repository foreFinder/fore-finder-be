class CreatePlayer < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.text :friends
      t.string :currentTeeTimes
    end
  end
end
