class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

         validates :name, presence: true, length: { maximum: 255, message: '氏名は255文字以内で入力してください' }
         validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: :invalid_format }
         validates :password, presence: true, length: { minimum: 8, message: 'パスワードは8文字以上でなければなりません。' }
         validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
                                      message: '英数字8文字以上で入力してください。'}
end