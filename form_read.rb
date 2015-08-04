require 'rack'
require 'rack/server'
require_relative 'form_process'
$s = Student.new
class FormCont

  def request_form(env)
    request = Rack::Request.new env
    request.params
      $s.name = request.params['name']
      $s.age  = request.params['age']
      $s.mob  = request.params['mob']
      $s.dept = request.params['dep']
      $s.email = request.params['email']
      if $s.save
        [200, {"Content-Type" =>"text/html"}, ["Successfully Added"]]
      else
        response = Rack::Response.new
         response.write 'You Have following errors!!'
        $s.errors.full_messages.each.with_index do |i,index|
          response.write "\n#{index} : #{i}\n"
        end
        response['X-Custom-Header'] = "'Content-Type' => 'text/html'"
        response.status = 202
        response.finish
      end
  end
end

class FormContApp
  def self.call(env)
    form_data = FormCont.new.request_form(env)
  end
end

Rack::Server.start :app => FormContApp
