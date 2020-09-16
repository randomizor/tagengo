class CreateLevels < ActiveRecord::Migration[6.0]
  def change
    create_table :levels do |t|
      t.uuid   :uuid, null: false, unique: true, default: "gen_random_uuid()"
      t.string :name
      t.timestamps
    end
  end
end
