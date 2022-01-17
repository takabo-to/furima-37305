class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :nickname, presence: true
  validate :first_name, presence: true
  validate :last_name, presence: true
  validate :first_name_kana, presence: true
  validate :last_name_kana, presence: true 
  validate :birthday, presence: true
end
