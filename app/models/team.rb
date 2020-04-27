class Team < ApplicationRecord
  has_many :team_members
  has_one :survey

end
