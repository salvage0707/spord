FactoryBot.define do
	# なぜかバリデーションがおかしくかかっている
  factory :board_user do
    permission 0
    approval false
    comment "コメントです"
    user
    board
  end

  # 女性の作成
  # factory :board_user_woman, class: BoardUser do
  #   permission 0
  #   approval false
  #   comment "コメントです"
  #   association :user, factory: :woman
  #   board
  # end

  # 男性の作成
  # factory :board_user_man, class: BoardUser do
  #   permission 0
  #   approval false
  #   comment "コメントです"
  #   association :user, factory: :man
  #   board
  # end
end
