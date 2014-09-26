require 'rack'

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

		# TODO: render top html
		songs.each do |song|
			response.write("<tr>\n<td>#{song[0]}</td><td>#{song[1]}</td><td>#{song[2]}</td>\n</tr>\n")
		end
		# TODO: render bottom html
		response.finish 
	end 


	def render_404 
		[404, {"Content-Type" => "text/plain"},["nothing here!"]]
	end 
end 

Rack::Handler::WEBrick.run AlbumApp.new, :Port => 8080 


/File.readlines("top_100_albums.txt", "rb") { |file| response.write(file.read)} /