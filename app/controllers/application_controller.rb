class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  allow_browser versions: :modern

 

  helper_method :current_user # This line makes it available in the views

  # ... other code ...
end