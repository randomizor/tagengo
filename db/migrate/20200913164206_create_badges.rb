class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.uuid   :uuid, null: false, unique: true, default: "gen_random_uuid()"
      t.string :icon
      t.text   :description
      t.timestamps
    end
  end
end
