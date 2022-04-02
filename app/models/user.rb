class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は半角英数字を両方含める必要があります' }

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :furigana_family_name, presence: true
  validates :furigana_first_name, presence: true
  validates :birthday, presence: true

end

