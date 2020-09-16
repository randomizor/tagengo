class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.uuid   :uuid, null: false, unique: true, default: "gen_random_uuid()"
      t.string :name
      t.string :code
      t.timestamps
    end
  end
end
