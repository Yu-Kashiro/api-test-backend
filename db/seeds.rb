# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
if Post.count.zero?
	Post.create!(
		[
			{ title: '最初の投稿', content: 'これはサンプルの内容です。' },
			{ title: 'Rails API勉強', content: 'CRUD操作を練習しましょう。' }
		]
	)
	puts 'Seed: posts created'
end
