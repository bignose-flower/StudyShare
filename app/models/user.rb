class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :birth_date, presence: true
  validates :job, presence: true
  validate :job_not_default

  has_many :questions
  has_many :answers

  def job_not_default
    if job.present? && (job == "職業を選んでください")
      errors.add(:job, "を入力してください")
    end
  end

  enum job_select: {
      "職業を選んでください": "職業を選んでください",
      "中学生": "中学生",
      "高校生": "高校生",
      "大学生": "大学生",
      "その他": "その他"
  }, _prefix: true

  mount_uploader :image, ImagesUploader
end
