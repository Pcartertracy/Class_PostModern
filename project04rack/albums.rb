require 'rack'
require 'sqlite3'

class Album
	attr_accessor :rank,:title,:year
	def initialize(rank, title, year)
		@rank = rank 
		@title = title
		@year = year
	end
end 

class AlbumApp 
	def call(env)
		request = Rack::Request.new(env)
		case request.path 
		when "/form" then render_form(request)
		when "/list" then render_list(request) 
		else render_404 
		end
	end
 
	def render_form(request) 
		response = Rack::Response.new 
	    response.write(ERB.new(File.read("form.html.erb")).result(binding))  
		response.finish 
	end 

	def render_list(request) 
		response = Rack::Response.new 

		data = []

		#SQLITE
		SQLite3::Database.open( "albums.sqlite3.db" ) do |db|
  			db.execute( "SELECT * FROM albums" ) do |row|
   				# puts row
   				 data << row
  			end
		end

		albums = []

		data.each_with_index do |a, i|
		   albums << Album.new( a[0], a[1], a[2])  # change per SQLite 
		end

		if (request.params["order"] == "name")
			albums.sort! do |l, r| 
				l.title <=> r.title
			end	
		elsif (request.params["order"] == "year")
			albums.sort! do |l, r| 
				l.year <=> r.year
			end
		end
		response.write(ERB.new(File.read("list.html.erb")).result(binding))
		response.finish 
	end 

	def render_404 
		[404, {"Content-Type" => "text/plain"},["nothing here!"]]
	end 

end 

Rack::Handler::WEBrick.run AlbumApp.new, :Port => 8080 
