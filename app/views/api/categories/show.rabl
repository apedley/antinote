object @category
attributes :id, :name

child :notes, :object_root => false do
  attributes :id, :title, :body_preview, :updated_short
end