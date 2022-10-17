class CreateRecruteurs < ActiveRecord::Migration[7.0]
  def change
    create_table :recruteurs do |t|
      t.string :nom
      t.string :prenom
      t.integer :telephone
      t.string :email
      t.string :job
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
