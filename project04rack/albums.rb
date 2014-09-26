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
		songs = []
			File.open("top_100_albums.txt", "rb") do |f| 
  			f.each_line.each do |line|
    		songs << line.split.map(&:to_i)
    		/File.readlines("top_100_albums.txt", "rb") { |file| response.write(file.read)} /
  			end
		end
		puts songs.inspect
		response.finish 
	end 

	def render_404 
		[404, {"Content-Type" => "text/plain"},["nothing here!"]]
	end 
end 

Rack::Handler::WEBrick.run AlbumApp.new, :Port => 8080 
