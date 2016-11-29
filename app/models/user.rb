class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token
  validates :f_name,presence: true, length: {minimum: 3}
  validates :l_name,presence: true,  length: {minimum: 3}
  before_save :downcase_email
  before_create :create_activation_digest

  has_secure_password
  validates :password, length: {minimum: 5} , allow_blank: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,length: {maximum: 100},
          format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
   self.remember_token = User.new_token 
   update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private
  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
