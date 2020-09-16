class CreateUserBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :user_badges do |t|
      t.uuid       :uuid, null: false, unique: true, default: "gen_random_uuid()"
      t.references :user, foreign_key: true, null: false
      t.references :badge, foreign_key: true, null: false
      t.timestamps
    end
  end
end
