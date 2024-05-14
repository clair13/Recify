class Recipe < ApplicationRecord
  has_many :steps, dependent: :destroy

  broadcasts_refreshes
  
  has_one_attached :image do |attachable|
    attachable.variant :thumb,  resize_to_limit: [100, 100]
  end
end
