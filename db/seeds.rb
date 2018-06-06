# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者
Admin.create(name: "管理者",
						 email: "admin@example.com",
						 password: "password")


# 関東など、県
region = Region.create(name: "北海道地方")
region.areas.create(name: "")