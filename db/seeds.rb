# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 生成メッセージ
def error_message(object, message)
	if object.errors.any?
		object.errors.full_messages.each do |msg|
			p msg
		end
		puts "#{message}生成に失敗しました"
	else
		puts "#{message}は生成されました"
	end
end


# 管理者
Admin.create(name: "管理者",
						 email: "admin@example.com",
						 password: "password")



# 関東など、県
def make_areas(area_array, region)
	area_array.each do |name|
		Area.create(name: name,
								region_id: region.id)
		# binding.pry if area_array[0] == "北海道"
	end
end

region = Region.create(name: "北海道地方")
areas = %W(北海道)
make_areas(areas, region)

region = Region.create(name: "東北地方")
areas = %W(青森県 岩手県 宮城県 秋田県 山形県 福島県)
make_areas(areas, region)

region = Region.create(name: "関東地方")
areas = %W(茨城県 栃木県 群馬県 埼玉県 千葉県 東京都 神奈川県)
make_areas(areas, region)

region = Region.create(name: "中部地方")
areas = %W(愛知県 岐阜県 静岡県 山梨県 長野県 福井県 石川県 富山県 新潟県)
make_areas(areas, region)

region = Region.create(name: "近畿地方")
areas = %W(大阪府 京都府 兵庫県 奈良県 三重県 滋賀県 和歌山県)
make_areas(areas, region)

region = Region.create(name: "中国地方")
areas = %W(鳥取県 島根県 岡山県 広島県 山口県)
make_areas(areas, region)

region = Region.create(name: "四国地方")
areas = %W(徳島県 香川県 愛媛県 高知県)
make_areas(areas, region)

region = Region.create(name: "九州地方")
areas = %W(長崎県 佐賀県 福岡県 大分県 熊本県 宮崎県 鹿児島県 沖縄県)
make_areas(areas, region)



# スポーツ
sports = %W(サッカー 野球 テニス バスケットボール ゴルフ
						 バレーボール フットサル 卓球 バドミントン 自転車)

sports.each do |s|
	Sport.create(name: s)
end

# 目的
purposes = %W(みんなで楽しく わいわい 本気で 教えながら 初心者歓迎 上級者歓迎
							 次回も開催予定)

purposes.each do |p|
	Purpose.create(name: p)
end

# 階級
ranks = %W(経験なし 初心者 中級者 上級者 プロ級)
ranks.each do |r|
	Rank.create(name: r)
end













5.times do |n|
	gimei = Gimei.name
	object = User.create(name: gimei.kanji,
							nickname: Faker::Name.name,
							email:  Faker::Internet.email,
							age: rand(14..70),
							area_id: rand(10..30),
							city: "杉並区",
							sex: true,
							introduction: "テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介",
							password: "password",
							)
	# 確認用
	error_message(object, "User(男性)") if n == 4

end

5.times do |n|
	gimei = Gimei.name
	object = User.create(name: gimei.kanji,
							nickname: Faker::Name.name,
							email:  Faker::Internet.email,
							age: rand(14..70),
							area_id: rand(10..30),
							city: "杉並区",
							sex: false,
							introduction: "テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介",
							password: "password",
							)

	# 確認用
	error_message(object, "User(女性)") if n == 4
end

# 単発募集
boards = %W(テスト単発募集1 テスト単発募集2)
boards.each do |b|
	object = Board.create(name: b,
							 sport_id: rand(1..sports.length),
							 do_date: Date.today,
							 area_id: rand(10..20),
							 city: "杉並区",
							 qualification: "初心者歓迎",
							 place: "大和スポーツセンター",
							 closing_date: Date.today.next_month,
							 max_people: rand(10..50),
							 introduction: "テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介",
							 manager_user_id: rand(1..10),
							 community_id: nil,
							 )
	# 確認用
	error_message(object, "board(単発)") if object.name == boards.last
end

# コミュニティ関連
boards = %W(テスト募集1 テスト募集2)
boards.each do |b|
	object = Board.create(name: b,
							 sport_id: rand(1..sports.length),
							 do_date: Date.today,
							 area_id: rand(10..20),
							 city: "杉並区",
							 qualification: "初心者歓迎",
							 place: "大和スポーツセンター",
							 closing_date: Date.today.next_month,
							 max_people: rand(10..50),
							 introduction: "テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介",
							 manager_user_id: rand(1..10),
							 community_id: 1,
							 )
	# 確認用
	error_message(object, "board(コミュニティ)") if object.name == boards.last
end



# コミュニティー
communities = %W(テストコミュニティー1 テストコミュニティー2)
communities.each do |c|
	object = Community.create(name: c,
									 sport_id: 1,
									 active_date: "毎週土曜日に開催してます！",
									 place: "大和スポーツセンター",
									 area_id: 16,
									 city: "東京都　杉並区",
									 max_people: 50,
									 qualification: "初心者歓迎",
									 introduction: "テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介テスト紹介",
									 manager_user_id: 1,
									 )

	# 確認用
	error_message(object, "community") if object.name == communities.last
end






