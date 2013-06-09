FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "some name #{n}" }
    factory :category_with_notes do
      after(:create) do |category|
        category.notes << FactoryGirl.create(:note)
        category.notes << FactoryGirl.create(:note)
      end
    end
  end
end