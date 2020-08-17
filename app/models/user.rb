require 'digest/md5'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :team_members
  has_many :teams, through: :team_members
  has_one :payment_profile

  def full_name
    "#{first_name} #{last_name}"
  end

  def gravatar_url
    hash = Digest::MD5.hexdigest(self.email)
    "https://www.gravatar.com/avatar/#{hash}"
  end

end
