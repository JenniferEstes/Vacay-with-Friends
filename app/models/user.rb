class User < ApplicationRecord
  has_many :vacations, through: :groups
  has_many :goals
  has_and_belongs_to_many :groups

  #gives password validation
  #gives reader and writer methods
  #gives authenticate method
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :password, length: { in: 3...128 }

  def self.find_or_create_by_github_omniauth(auth)
    user = self.find_or_create_by(email: auth[:info][:email]) do |u|
      u.password = SecureRandom.hex
    end
    if !user.id && !user.save
      flash[:notice] = 'Could not create an account using Github.'
      redirect_to new_user_path
    else
      user
    end
  end
end

