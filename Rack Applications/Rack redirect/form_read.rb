require 'rack'
require 'rack/server'
require_relative 'form_process'
@root = File.expand_path(File.dirname(__FILE__))
$s = Student.new
app = lambda{|env|
     #success_file = "#{@root}" + "#{path}/sucess.html"
     #error_file = "#{@root}" + "#{path}/error.html"
    response = Rack::Response.new
    request = Rack::Request.new env
    p request
    p response
    path = request.path_info
    if request.post?
      path = request.path_info
      $s.name = request.params['name']
      $s.age  = request.params['age']
      $s.mob  = request.params['mob']
      $s.dept = request.params['dep']
      $s.email = request.params['email']
      if $s.save
         response.redirect("/success")
         response.finish
      else
        response.redirect("/error")
        response.finish
      end
    else
      if path =~ /success/
        [200,{},File.open('sucess.html', File::RDONLY)]
      elsif path=~ /error/
        [200,{},File.open('error.html',File::RDONLY)]
      elsif path=~ /index/
         [200,{},File.open('index.html',File::RDONLY)]
      end

    end
}
Rack::Server.start :app => app
