require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'Splash Screen' do
    it 'should display the home page by redirecting' do
      get '/'
      expect(response.status).to eq(200)
      expect(response.body).to include('My Budget App')
      expect(response.body).to include('LOG IN')
      expect(response.body).to include('SIGN UP')
    end
  end
end
