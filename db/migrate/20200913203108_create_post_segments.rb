class CreatePostSegments < ActiveRecord::Migration[6.0]
  def change
    create_table :segments do |t|
      t.uuid       :uuid, null: false, unique: true, default: "gen_random_uuid()"
      t.references :post, foreign_key: true
      t.text :segment
      t.timestamps
    end
  end
end
