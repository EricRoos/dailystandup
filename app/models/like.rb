class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true, touch: true
end
