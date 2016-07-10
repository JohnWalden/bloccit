require 'rails_helper'
include RandomData

RSpec.describe AddsController, type: :controller do
  
  let(:my_ad) do
    Add.create(
      id: 1,
      title: RandomData.random_sentence,
      copy: RandomData.random_paragraph,
      price: 99
      )
    end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns [my_add] to @adds" do
      get :index
      expect(assigns(:adds)).to eq([my_ad])
    end
  end
  
  describe "GET #show" do
    it "returns http success" do
      get :show, {id: my_ad.id}
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #show view" do
      get :show, {id: my_ad.id}
      expect(response).to render_template :show
    end
    
    it "assigns my_ad to @add" do
      get :show, {id: my_ad.id}
      expect(assigns(:add)).to eq(my_ad)
    end
  end
  
  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
    
    it "instantiates @advertisements" do
      get :new
      expect(assigns(:add)).not_to be_nil
    end
  end
  
  describe "POST create" do
    it "increases the number of advertisements by 1" do
      expect {post :create, add: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}}.to change(Add,:count).by(1)
    end
    
    it "assigns the new advertiseemtn to @add" do
      post :create, add: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}
      expect(assigns(:add)).to eq Add.last
    end
    
    it "redirect to the new advertisement" do
      post :create, add: {title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99}
      expect(response).to redirect_to Add.last
    end
  end
end
