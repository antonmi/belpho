require 'sinatra'
require 'pry'
$: << Dir.pwd
require 'year'

get '/' do
  erb :index
end

helpers do
  def link_to_problems(name, file, which)
    "<a href=#{request.scheme}://#{request.host}:#{request.port}/problems/#{which}/#{file}>#{name}</a>"
  end
end

