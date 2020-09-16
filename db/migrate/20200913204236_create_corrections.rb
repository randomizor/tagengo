class CreateCorrections < ActiveRecord::Migration[6.0]
  def change
    create_table :corrections do |t|
      t.uuid       :uuid, null: false, unique: true, default: "gen_random_uuid()"
      t.references :post, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
