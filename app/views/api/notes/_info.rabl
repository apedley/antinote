object @note
attributes :id, :title, :body, :rendered_body, :updated_at, :created_at

child :category do
  attributes :id, :name
end