require 'rails_helper'

describe "destroy a destination route", :type => :request do
  let!(:destination) { @d = FactoryBot.create :destination }

  before do
    delete "/destinations/#{@d.id}"
  end

  it 'removes the destination' do
    expect(JSON.parse(response.body)['message']).to eq("Your Destiation has been successfully removed.")
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:ok)
  end
end
