class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.uuid       :uuid, null: false, unique: true, default: "gen_random_uuid()"
      t.string     :name, null: false, unique: true
      t.string     :description
      t.timestamps
    end
  end
end
