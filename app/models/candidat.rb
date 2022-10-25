class Candidat < ApplicationRecord
  belongs_to :user

  validates :telephone, uniqueness: true
  validates :email, uniqueness: true
  validates :departement, numericality: { only_integer: true }, length: { is: 2 }
end
