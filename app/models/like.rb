class Like < ApplicationRecord
  belongs_to :user
  belongs_to :answer
  validates_uniqueness_of :answer_id, scope: :usdr_id
end
