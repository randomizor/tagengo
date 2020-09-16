class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.uuid   :uuid, null: false, unique: true, default: "gen_random_uuid()"
      t.string :title
      t.text :entry
      t.text :translation
      t.references :category, foreign_key: true, null: false
      t.references :user,     foreign_key: true, null: false
      t.references :language, foreign_key: true, null: false
      t.references :level,    foreign_key: true, null: false
      t.references :prompt,   foreign_key: true
      t.timestamps
    end
  end
end
