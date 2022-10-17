class CreateCandidats < ActiveRecord::Migration[7.0]
  def change
    create_table :candidats do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :sexe
      t.integer :telephone
      t.integer :departement
      t.text :infos
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
