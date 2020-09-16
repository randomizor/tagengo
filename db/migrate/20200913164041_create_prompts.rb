class CreatePrompts < ActiveRecord::Migration[6.0]
  def change
    create_table :prompts do |t|
      t.uuid   :uuid, null: false, unique: true, default: "gen_random_uuid()"
      t.text :prompt
      t.references :user,     foreign_key: true, null: false
      t.references :language, foreign_key: true, null: false
      t.references :level,    foreign_key: true, null: false
      t.timestamps
    end
  end
end
