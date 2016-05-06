require 'rails_helper'

describe Customers::AccomodationsController, type: :controller do

  describe 'Basic crud operations for accomodations' do

    before :each do
      @user = create(:user)
      @customer = create(:customer, user: @user)
      @accomodation_type_home = create(:accomodation_type, name: 'home')
      @accomodation_type_flat = create(:accomodation_type, name: 'flat')
      @accomodation = create(:accomodation, name: 'Valhalla')
      @customer_accomodation = create(:customer_accomodation, customer: @customer, accomodation: @accomodation)
      login_user @user
    end


    it 'Should fetch accomodations list for given user' do
      get :index, format: :json

      expect(response).to have_http_status(:success)

      expect(json['data'][0]['attributes']['name']).to eq(@accomodation.name)
      expect(json['data'][0]['attributes']['address-1']).to eq(@accomodation.address_1)
      expect(json['data'][0]['attributes']['address-2']).to eq(@accomodation.address_2)
      expect(json['data'][0]['attributes']['city']).to eq(@accomodation.city)
      expect(json['data'][0]['attributes']['zip']).to eq(@accomodation.zip)
      expect(json['included'][0]['attributes']['name']).to eq(@accomodation.accomodation_type.name)
    end

    it 'Should create new accomodation record' do
      post :create, {data:{
          attributes:{
              name: 'My accomodation',
              'address-1': 'Address 1',
              'address-2': 'Address 2',
              city: 'Warsaw',
              zip: '000-00-000',
          },
          relationships:{
              'accomodation-type':{
                  data:{
                      type: 'accomodation-types',
                      id: @accomodation_type_flat.id}},
              'customers':{'data':[]}
          },
          type:'accomodations'}, format: :json}

      expect(response).to have_http_status(:success)

      accomodation = Accomodation.find_by_name('My accomodation')

      expect(accomodation.present?).to be(true)

      expect(accomodation.name).to eq('My accomodation')
      expect(accomodation.address_1).to eq('Address 1')
      expect(accomodation.address_2).to eq('Address 2')
      expect(accomodation.city).to eq('Warsaw')
      expect(accomodation.zip).to eq('000-00-000')
      expect(accomodation.accomodation_type.name).to eq(@accomodation_type_flat.name)
    end

    it 'Should update existing accomodation record data' do
      patch :update,  {id: @accomodation, data:{
          attributes:{
              name: 'Updated accomodation',
              'address-1': 'Updated Address 1',
              'address-2': 'Updated Address 2',
              city: 'Updated Warsaw',
              zip: '000-11-000',
          },
          relationships:{
              'accomodation-type':{
                  data:{
                      type: 'accomodation-types',
                      id: @accomodation_type_home.id}},
              'customers':{'data':[]}
          },
          type:'accomodations'}, format: :json}

      expect(response).to have_http_status(:success)

      @accomodation.reload

      expect(@accomodation.name).to eq('Updated accomodation')
      expect(@accomodation.address_1).to eq('Updated Address 1')
      expect(@accomodation.address_2).to eq('Updated Address 2')
      expect(@accomodation.city).to eq('Updated Warsaw')
      expect(@accomodation.zip).to eq('000-11-000')
      expect(@accomodation.accomodation_type.name).to eq(@accomodation_type_home.name)
    end

    it 'Should destory exisiting accomodation record' do
      delete :destroy, { id: @accomodation, format: :json}

      expect(response).to have_http_status(:success)

      accomodation = Accomodation.find_by_id(@accomodation.id)

      expect(accomodation.blank?).to be(true)
    end

  end

end
