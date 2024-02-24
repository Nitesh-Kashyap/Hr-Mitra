class Document < ApplicationRecord
  DOC_TYPES = ["Educational", "salary", "photo-id", "proofs", "others"].freeze
  belongs_to :employee
  has_one_attached :file
  validates :name, :doc_type, :employee_id, presence: true
end
