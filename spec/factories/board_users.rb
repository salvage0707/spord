FactoryBot.define do
  factory :board_user do
    permission 0
    approval false
    comment "MyString"
    user
    board
  end
end
