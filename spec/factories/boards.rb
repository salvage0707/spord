FactoryBot.define do
  factory :board, class: Board do
    name "シングル募集"
    do_date { Date.today }
    closing_date { Date.today.next_month }
    city "東京都　杉並区"
    max_people { rand(10..40) }
    introduction "MyTextMyText MyText"
    qualification "初心者歓迎!"
    place "大和スポーツセンター"

    # 関連付け
    sport
    area
    association :manager_user, factory: :manager_user
    after(:build) do |board|
        # なぜか使えない
        # board.users << FactoryBot.build(:man)
        # board.users << FactoryBot.build(:woman)

        board.ranks << FactoryBot.build_list(:rank, 5)
    end

    # area_num 1
    # sports_id 1
    # manager_user_id 1
    # community_id 1
    # delete_flag 1
    # image_id


  end
end
