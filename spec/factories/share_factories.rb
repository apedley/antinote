FactoryGirl.define do
  factory :share do
    note FactoryGirl.create(:note)
  end
end
