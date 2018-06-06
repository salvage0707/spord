FactoryBot.define do
  factory :hokkaidochiho, class: Region do
    name "北海道地方"
    name_kana "ホッカイドウ"
  end

  factory :touhokuchiho, class: Region do
    name "東北地方"
    name_kana "トウホク"
  end

  factory :kantochiho, class: Region do
    name "関東地方"
    name_kana "カントウ"
  end

  factory :chubuchiho, class: Region do
    name "中部地方"
    name_kana "チュウブ"
  end

  factory :kinkichiho, class: Region do
    name "近畿地方"
    name_kana "キンキ"
  end

  factory :chugokuchiho, class: Region do
    name "中国地方"
    name_kana "チュウゴク"
  end

  factory :shikokuchiho, class: Region do
    name "四国地方"
    name_kana "シコク"
  end

  factory :kyushuchiho, class: Region do
    name "九州地方"
    name_kana "キュウシュウ"
  end
end
