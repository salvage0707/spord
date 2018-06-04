FactoryBot.define do
  factory :community_user do
    user_id 1
    community_id 1
    permission 1
    comment "MyString"
    approval false
  end
end
