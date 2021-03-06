class Question < ApplicationRecord

  validates :title, presence: true
  validates :question, presence: true

  belongs_to :user
  belongs_to :subject
  has_many :answers

  def self.search(keyword)
    Question.where('title LIKE ?', "%#{keyword}")
  end
end
