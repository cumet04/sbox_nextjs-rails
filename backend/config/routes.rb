Rails.application.routes.draw do
  scope format: false do
    get :events, to: "events#index"
  end
end
