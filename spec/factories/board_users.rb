FactoryBot.define do
  factory :board_user do
    user_id 1
    board_id 1
    permission false
    comment "MyString"
    manager_flag 1
  end
end
