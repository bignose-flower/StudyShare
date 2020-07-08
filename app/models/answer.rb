class Answer < ApplicationRecord
  validates :answer, presence: true

  belongs_to :user
  belongs_to :question
  has_many :likes, dependent: :destroy
end
