require 'rails_helper'

describe "get all the destinations reviews route", :type => :request do
  let!(:destination) { @d = FactoryBot.create(:destination)}

  before do
    post "/destinations/#{@d.id}/reviews",
    params: { :author => 'Keegan', :content => 'blah blah blah', :rating => 1 }
    get "/destinations/#{@d.id}/reviews"
  end

  it 'returns all destination reviews' do
    expect(JSON.parse(response.body).size).to eq(1)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

end

describe "returns 404 not fournd", :type => :request do
  before { get '/destinations/333' }
  it 'returns status code 404' do
    expect(response).to have_http_status(:not_found)
  end
end

describe "get a destinations reviews show", :type => :request do
  let!(:destination) { @d = FactoryBot.create(:destination)}



  before do
    @y = Review.create!(:destination_id => @d.id, :author => 'Keegan', :content => 'blah blah blah', :rating => 1)
    get "/destinations/#{@d.id}/reviews/#{@y.id}"
  end

  it 'returns a destinations review page' do
    expect(JSON.parse(response.body)['author']).to eq("Keegan")
  end
end
