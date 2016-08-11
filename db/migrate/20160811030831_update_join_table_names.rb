class UpdateJoinTableNames < ActiveRecord::Migration[5.0]
  def change
    rename_table :team_members, :team_memberships
    rename_table :channel_members, :channel_memberships
    rename_table :message_readers, :message_readerships
  end
end
