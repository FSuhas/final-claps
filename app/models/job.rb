class Job < ApplicationRecord
  belongs_to :recruteur

  has_many_attached :photos


  # validates :titre, presence: true
  # validates :date, presence: true
  # validates :description, presence: true
  include PgSearch::Model

  pg_search_scope :search_by_query, against: %i[sexe departement], using: { tsearch: { prefix: true } }
end
