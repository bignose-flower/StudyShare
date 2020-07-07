class Question < ApplicationRecord

  validates :title, presence: true
  validates :question, presence: true

  belongs_to :user
  belongs_to :subject
end
