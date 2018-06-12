FactoryBot.define do

  factory :area, class: Area do
    name "東京"
    name_kana "tokyo"
    region
  end




  # 関東など、県
# def make_areas(area_array, region)
#   area_array.each do |name|
#     factory :hokkaido, class: Area do
#       name "MyString"
#       name_kana "MyString"
#       region_id 1
#   end
# end

# region = hokkaido
# areas = [{name: "北海道", eng: "hokkaido"}]
# make_areas(areas, region)

# region = Region.create(name: "東北地方")
# areas = %W(青森県 岩手県 宮城県 秋田県 山形県 福島県)
# areas = %W(aomoriken iwateken miyazakiken yamagataken fukusimaken)
# areas = []
# make_areas(areas, region)

# region = Region.create(name: "関東地方")
# areas = %W(茨城県 栃木県 群馬県 埼玉県 千葉県 東京都 神奈川県)
# make_areas(areas, region)

# region = Region.create(name: "中部地方")
# areas = %W(愛知県 岐阜県 静岡県 山梨県 長野県 福井県 石川県 富山県 新潟県)
# make_areas(areas, region)

# region = Region.create(name: "近畿地方")
# areas = %W(大阪府 京都府 兵庫県 奈良県 三重県 滋賀県 和歌山県)
# make_areas(areas, region)

# region = Region.create(name: "中国地方")
# areas = %W(鳥取県 島根県 岡山県 広島県 山口県)
# make_areas(areas, region)

# region = Region.create(name: "四国地方")
# areas = %W(徳島県 香川県 愛媛県 高知県)
# make_areas(areas, region)

# region = Region.create(name: "九州地方")
# areas = %W(長崎県 佐賀県 福岡県 大分県 熊本県 宮崎県 鹿児島県 沖縄県)
# make_areas(areas, region)
end
