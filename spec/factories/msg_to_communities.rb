FactoryBot.define do
  factory :msg_to_community do
    community_id 1
    user_id 1
    message "MyString"
    read false
  end
end
