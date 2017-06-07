Rails.application.routes.draw do
  scope module: 'consul/conversations' do
    resources :conversations
  end
end
