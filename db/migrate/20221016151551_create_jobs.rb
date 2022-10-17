class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :titre
      t.date :date
      t.string :role
      t.integer :age
      t.integer :departement
      t.string :sexe
      t.text :description
      t.references :recruteur, null: false, foreign_key: true

      t.timestamps
    end
  end
end
