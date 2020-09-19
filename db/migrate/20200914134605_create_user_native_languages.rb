class CreateUserNativeLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_native_languages do |t|
      t.uuid       :uuid,     null: false, unique: true, default: "gen_random_uuid()"
      t.references :user,     null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.timestamps
    end
  end
end
