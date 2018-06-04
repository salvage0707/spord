FactoryBot.define do
  factory :msg_to_user do
    to_user_id 1
    user_id 1
    meddage "MyString"
    read 1
  end
end
