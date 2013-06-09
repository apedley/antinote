object @category
attributes :id, :name

node :notes do |category|
  category.notes do |note|
    partial("api/notes/info", :object => note)
  end
end