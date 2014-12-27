class Database
	attr_reader :connection

	def initialize(connection)
		@connection = connection
		create_tables
	end

	def create_tables
		unless connection.table_exists?(:urls)
      connection.create_table :urls do
        primary_key   :id
        String        :url
        String        :pretty_url
      end
    end
	end

	def save(url)
		connection[:urls].insert(:url => url.url, 
														 :pretty_url => url.pretty_url)
	end

	def find(pretty_url)
		connection[:urls].filter(:pretty_url => pretty_url).first
	end

	def all_urls
		connection[:urls].map do |data|
			URL.new(data)
		end
	end
end
