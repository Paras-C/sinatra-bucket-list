require "sinatra"
require "sinatra/reloader" if development?

require_relative "./controllers/list_controller.rb"

use Rack::MethodOverride

run ListController