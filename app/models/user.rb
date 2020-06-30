class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :birth_date, presence: true
  validates :job, presence: true

  enum job_select: {
      default: :nil,
      junior: "中学生",
      high: "高校生",
      univ: "大学生",
      others: "その他"
  }, _prefix: true
end
