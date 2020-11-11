# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Room.create([
          {name: "シェアハウス渋谷", price: 100000, description: "渋谷駅より徒歩10分"},
          {name: "シェアハウス東京", price: 100000, description: "東京駅より徒歩8分"},
          {name: "シェアハウス新宿", price: 100000, description: "新宿駅より徒歩6分"},
          {name: "シェアハウス赤坂", price: 100000, description: "赤坂駅より徒歩5分、赤坂見附駅より徒歩７分"},
          {name: "シェアハウス品川", price: 100000, description: "品川駅より徒歩10分"}
          ])
