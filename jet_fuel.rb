require_relative 'url'
require_relative 'database'

DB = Sequel.sqlite('db/database.sqlite3')
Prettify.database = DB

class JetFuel < Sinatra::Base

	configure do
		def database
			@database ||= Database.new(DB)
		end
	end

	get '/' do
		erb :index, locals: { urls: database.all_urls }
	end

	get '/:pretty_url' do |pretty_url|
		url = database.find(pretty_url)
		redirect url[:url]
	end

	post '/' do
		url = URL.new({url: params[:url]})
		database.save(url)
		redirect "/"
	end
end
