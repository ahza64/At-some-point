class User < ActiveRecord::Base
  validates :username, presence: true
  validates :location, presence: true
  VALID_EMAIL_REGEX = /\w+@[^\.]+\.\w+/
  validates :email,
            presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: true,
            length:     { maximum: 255 }
  validates :password_digest, presence: true, length: { minimum: 8 }

  has_secure_password
  has_many :tasks

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

end
