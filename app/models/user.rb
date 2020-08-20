require 'digest/md5'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :team_members
  has_many :teams, through: :team_members
  has_one :payment_profile
  has_many :product_orders

  def full_name
    "#{first_name} #{last_name}"
  end

  def gravatar_url
    hash = Digest::MD5.hexdigest(self.email)
    "https://www.gravatar.com/avatar/#{hash}"
  end

  def team_limit
    2 + self.product_orders.confirmed.where(product_id: Product.where(sku: Constants::Skus::IncreaseTeamLimit)).count
  end

  def can_add_teams?
    teams.count < team_limit
  end

end
