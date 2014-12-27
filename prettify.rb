class Prettify
	def self.database=(db)
		@db = db
	end

	def self.generate
		loop do
  		possible = (('A'..'Z').to_a + (0..9).to_a + ('a'..'z').to_a)
  		random_token = (0...6).map { |n| possible.sample }.join
  		break random_token unless taken_urls.include?(random_token)
  	end
	end

	def self.taken_urls
		@db.from(:urls).map do |url|
			url[:pretty_url]
		end
	end
end
