class ListController < Sinatra::Base

  configure :development do 
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

  $listItems = [{
      activity_name: "Sleep More",
      activity_description: "Get in bed and Sleep more"
    },
    {
      activity_name: "Travel", 
      activity_description: "Visit Every continent"

    },
    {
      activity_name: "Sky Diving",
      activity_description: "Jump out of an aeroplane (with parachute ofc)"
    }]

  #INDEX
  get "/list" do
    @page_title = "Your Bucket List"
    @list = $listItems
    erb :"list/index"
  end

  #NEW
  get "/list/new" do
    erb :"list/new"
  end

  #SHOW
  get "/list/:id" do
    @id = params[:id].to_i
    @currentItem = $listItems[@id]
    erb :"list/show"
  end

  #CREATE
  post "/list" do
    new_item = {
      activity_name: params[:activity_name],
      activity_description: params[:activity_description]
    }
    $listItems << new_item
    redirect "/list"
  end

  #EDIT
  get "/list/:id/edit" do
    @id = params[:id].to_i
    @currentItem = $listItems[@id]
    erb :"list/edit"
  end

  #UPDATE
  put "/list/:id" do
    id = params[:id].to_i
    $listItems[id][:activity_name] = params[:activity_name]
    $listItems[id][:activity_description] = params[:activity_description]
    redirect "/list/#{id}"
  end

  #DELETE
  delete "/list/:id" do
    id = params[:id].to_i
    $listItems.delete_at(id)
    redirect "/list"

  end










end