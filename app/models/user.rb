class User < ApplicationRecord
  validates :f_name,presence: true, length: {minimum: 3}
  validates :l_name,presence: true,  length: {minimum: 3}

  has_secure_password
  validates :password, length: {minimum: 5}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,length: {maximum: 100},
          format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
