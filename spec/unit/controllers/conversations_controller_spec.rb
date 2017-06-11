RSpec.describe Consul::Conversations::ConversationsController, type: :controller do
  it do
    get :index

    expect(response.status).to eq(200)
  end
end
