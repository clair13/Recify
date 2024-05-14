class Step < ApplicationRecord
  belongs_to :recipe, touch: true
end
