class ListController < Sinatra::Base

  configure :development do 
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

  $listItems = [{
      activity_name: "Sleep More"
      activity_description: "Get in bed and Sleep more"
    },
    {
      activity_name: "Travel"  
      activity_description: "Visit Every continent"

    },
    {
      activity_name: "Sky Diving"
      activity_description: "Jump out of an aeroplane (with parachute ofc)"
    }]



  #INDEX
  get "/" do
    @page_title = "Your Bucket List"

  end

end