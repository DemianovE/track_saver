class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.datetime :startdate
      
      t.timestamps
    end
  end
end
