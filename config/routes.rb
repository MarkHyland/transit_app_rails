Rails.application.routes.draw do
  
  root 'transit#index'

  get "/stationLocation" => 'transit#location'
  get "/bikeshare"       => 'transit#bikes' 
  get "/trainRealTime"   => 'transit#minutes'

end
