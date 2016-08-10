class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :creator
      t.string :visibility

      t.timestamps
    end
  end
end
