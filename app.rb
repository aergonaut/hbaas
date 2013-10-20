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

  get '/' do
    methods = [
      {
        endpoint: "/to/you",
        description: "Simple, generic birthday greeting"
      },
      {
        endpoint: "/to/you/:name",
        arguments: { name: "/\w+/" },
        description: "Personalized greeting, with lucky person's own name"
      }
    ]

    respond_to do |f|
      f.html { haml :index, locals: { methods: methods } }
      f.json { json status: "success", methods: methods }
    end
  end

  get '/to/you' do
    haml :greeting, locals: { name: false }
  end

  get '/to/you/:name' do
    respond_to do |f|
      f.html { haml :greeting, locals: { name: params[:name] } }
      f.json { json status: "success", formatted: { message: "Happy Birthday to you, #{params[:name]}!" }, template: "Happy Birthday to you, :name!", name: params[:name] }
    end
  end

end
