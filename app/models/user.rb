class User < ApplicationRecord
  has_many :expenses, dependent: :destroy, foreign_key: :author_id
  has_many :categories, dependent: :destroy, foreign_key: :author_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
