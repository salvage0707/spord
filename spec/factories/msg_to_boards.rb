FactoryBot.define do
  factory :msg_to_board do
    board_id 1
    user_id 1
    message "MyString"
    read false
  end
end
