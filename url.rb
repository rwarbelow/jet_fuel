require 'prettify'

class URL
	attr_reader :url, :pretty_url, :id

	def initialize(attributes)
		@id = attributes[:id]
		@url = attributes[:url]
		@pretty_url = attributes[:pretty_url] || Prettify.generate
	end
end
