class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo

  has_many :projects, dependent: :destroy
  has_many :applications, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  # validates :first_name, :last_name, :password, presence: true


end
