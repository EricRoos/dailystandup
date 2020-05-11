class Activity < ApplicationRecord
  belongs_to :team
  belongs_to :notifiable, polymorphic: true
end
