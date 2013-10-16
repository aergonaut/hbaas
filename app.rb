require 'sinatra/base'
require 'sinatra/contrib'

class App < Sinatra::Base

  configure do
    set :haml, format: :html5
  end

  get '/to/you' do
    haml :index, locals: { name: false }
  end

  get '/to/you/:name' do
    haml :index, locals: { name: params[:name] }
  end

end
