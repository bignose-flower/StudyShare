class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, uniqueness: true
  validates :birth_date, presence: true
  validates :job, presence: true
  validate :job_not_default

  def job_not_default
    if job.present? && (job == "default")
      errors.add(:job, "を入力してください")
    end
  end

  enum job_select: {
      default: "職業を選んでください",
      junior: "中学生",
      high: "高校生",
      univ: "大学生",
      others: "その他"
  }, _prefix: true
end
