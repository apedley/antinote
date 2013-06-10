object @note
attributes :id, :title, :body, :rendered_body, :updated_at, :created_at, :updated_short, :body_preview

child :category do
  attributes :id, :name
end