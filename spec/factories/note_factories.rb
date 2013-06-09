FactoryGirl.define do
  factory :note do
    sequence(:title) { |n| "sometitle #{n}" }
    sequence(:body) { |b| "#some body #{b}" }
    category FactoryGirl.create(:category)
  end
end
