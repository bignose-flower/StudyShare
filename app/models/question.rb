class Question < ApplicationRecord

  validate :title, presence: true
  validate :question, presence: true

  belongs_to :user
  belongs_to :subject
end
