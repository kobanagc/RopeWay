class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.text :self_pr
      t.integer :sex_id, null: false
      t.integer :age, null: false
      t.integer :residence_id, null: false
      t.integer :rope_patron_id, null: false
      t.timestamps
      t.integer :user_id, foreign_key: true
    end
  end
end
