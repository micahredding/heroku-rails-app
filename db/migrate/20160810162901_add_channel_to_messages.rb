class AddChannelToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :channel_id, :integer
  end
end
