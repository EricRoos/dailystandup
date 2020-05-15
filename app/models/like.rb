class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true, touch: true, counter_cache: true
end
