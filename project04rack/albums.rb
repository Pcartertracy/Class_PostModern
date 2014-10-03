require 'rack'

class Album
	attr_accessor :rank,:title,:year

	def init(rank, str)
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
		File.open("form.html", "rb") { |form| response.write(form.read)} 
		(1..100).each { |i| response.write("<option value=\"#{i}\">#{i}</option>\n")}
		File.open("formBottem.html", "rb") { |form| response.write(form.read)}
		response.finish 
	end 

	def render_list(request) 
		response = Rack::Response.new 
		data = []
		File.open("top_100_albums.txt", "rb") do |f|
  			f.each_line do |line|
  				line.chomp!
    			data << line.split(", ")
  			end
		end
		songs = []
		data.each_with_index do |a, i|
			songs << [i + 1, a[0], a[1]]
		end

		if (request.params["order"] == "name")
			songs.sort! do |l, r| 
				l[1] <=> r[1]
			end	
		elsif (request.params["order"] == "year")
			songs.sort! do |l, r| 
				l[2] <=> r[2]
			end
		end

		File.open("list.html", "rb") { |list| response.write(list.read)} 
		songs.each do |song|
			response.write("\t<tr class=\"selected\">\n" : "\t<tr>\n")
			response.write("<tr>\n<td>#{song[0]}</td><td>#{song[1]}</td><td>#{song[2]}</td>\n</tr>\n")


			/response.write("<tr>\n<td>#{album.rank]}</td><td>#{album.name}</td><td>#{album.year}</td>\n</tr>\n")/
		end
		File.open("listBottem.html", "rb") { |list| response.write(list.read)}
		response.finish 
	end 

	def render_404 
		[404, {"Content-Type" => "text/plain"},["nothing here!"]]
	end 

end 

Rack::Handler::WEBrick.run AlbumApp.new, :Port => 8080 
