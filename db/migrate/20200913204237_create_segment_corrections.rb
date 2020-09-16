class CreateSegmentCorrections < ActiveRecord::Migration[6.0]
  def change
    create_table :segment_corrections do |t|
      t.uuid       :uuid, null: false, unique: true, default: "gen_random_uuid()"
      t.references :segment, foreign_key: true, null: false
      t.references :correction, foreign_key: true, null: false
      t.text :entry
      t.text :comment
      t.timestamps
    end
  end
end
