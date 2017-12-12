require 'rails_helper'

describe "patch a destination route", :type => :request do
  let!(:destination) { @d = FactoryBot.create :destination }

  before do
    patch "/destinations/#{@d.id}", params: {:city => "Seattle"}
  end

  it 'updates the destination country' do
    expect(JSON.parse(response.body)['message']).to eq("Your Destination has been updated successfully.")
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:ok)
  end
end
