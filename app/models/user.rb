class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :birth_date, presence: true
  validate :birthday_not_registered_less_than_16
  validates :job, presence: true

  def birthday_not_registered_less_than_16
    if birth_date.present? && (Date.today - birth_date) < 16
      errors.add(:birth_date, "15際以下は登録できません。")
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
