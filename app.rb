require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/reloader'

class App < Sinatra::Base

  configure do
    register Sinatra::Contrib

    set :haml, format: :html5
  end

  configure :development do
    register Sinatra::Reloader
  end

  respond_to :html, :json

  get '/to/you' do
    haml :index, locals: { name: false }
  end

  get '/to/you/:name' do
    haml :index, locals: { name: params[:name] }
  end

end
