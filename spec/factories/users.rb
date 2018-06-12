FactoryBot.define do
  factory :user, class: User do
    gimei = Gimei.name
    name { gimei.kanji }
    nickname { Faker::Name.name }
    email  { Faker::Internet.email }
    age { rand(14..70) }
    city "杉並区"
    sex false
    introduction "テスト紹介テスト紹介テスト紹介テスト紹介テスト"
    password "password"

    # 関連付け
    area
  end

  factory :man, class: User do
  	gimei = Gimei.name
    name { gimei.kanji }
    nickname { Faker::Name.name }
    email  { Faker::Internet.email }
    age { rand(14..70) }
    city "杉並区"
    sex false
    introduction "テスト紹介テスト紹介テスト紹介テスト紹介テスト"
    password "password"

    # 関連付け
    area
  end

  factory :woman, class: User do
  	gimei = Gimei.name
    name { gimei.kanji }
    nickname { Faker::Name.name }
    email  { Faker::Internet.email }
    age { rand(14..70) }
    city "杉並区"
    sex true
    introduction "テスト紹介テスト紹介テスト紹介テスト紹介テスト"
    password "password"
    # 関連付け
    area
  end

  factory :other_user, class: User do
  	gimei = Gimei.name
    name { gimei.kanji }
    nickname { Faker::Name.name }
    email  { Faker::Internet.email }
    age { rand(14..70) }
    city "杉並区"
    sex false
    introduction "テスト紹介テスト紹介テスト紹介テスト紹介テスト"
    password "password"
    # 関連付け
    area
  end
  factory :manager_user, class: User do
  	gimei = Gimei.name
    name { gimei.kanji }
    nickname { Faker::Name.name }
    email  { Faker::Internet.email }
    age { rand(14..70) }
    city "杉並区"
    sex false
    introduction "マネージャー"
    password "password"
    # 関連付け
    area
  end
end
