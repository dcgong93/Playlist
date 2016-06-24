class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.references :user, index: true
      t.references :single, index: true

      t.timestamps
    end
  end
end
