# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  email                :string           not null
#  password_digest      :string           not null
#  authentication_token :string           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class User < ApplicationRecord
  validates :email, :authentication_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  after_initialize :ensure_authentication_token

  attr_reader :password

  # creates a new random number to act as authentication_token
  def self.generate_authentication_token
    SecureRandom::urlsafe_base64(16)
  end

  # creates and saves an auth token if none exists
  # returns token so that it can be passed to session
  def ensure_authentication_token
    self.authentication_token ||= User.generate_authentication_token
    self.authentication_token
  end

  # generates and sets new auth token
  # returns it to pass to session
  def reset_authentication_token
    self.authentication_token = User.generate_authentication_token
    self.save
    self.authentication_token
  end

  # takes in password instance variable so it can be validated
  # hashes it and sends hash to db
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(@password)
  end

  # takes in a password entry and tests it for correctness
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  # finds a user by email and password
  # returns nil for non existant email or wrong password
  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

end
