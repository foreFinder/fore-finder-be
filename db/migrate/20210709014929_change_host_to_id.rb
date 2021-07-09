class ChangeHostToId < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :host, :host_id
  end
end
