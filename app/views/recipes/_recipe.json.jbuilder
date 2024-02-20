json.extract! recipe, :id, :title, :description, :preparation_time, :difficulty_level, :portion, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
