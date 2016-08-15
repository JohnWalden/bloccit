require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let (:my_question) do
      Question.create(
          id: 1,
          title: RandomData.random_sentence,
          body: RandomData.random_paragraph,
          resolved: false
       )
   end
   
   describe "GET #index" do
       it "returns http success" do
           get :index
           expect(response).to have_http_status(:success)
       end
       
       it "assigns my_question to @question" do
           get :index
           expect(assigns(:questions)).to eq([my_question])
       end
    end
    
    describe "GET show" do
      it "returns http success" do
        get :show, {id: my_question.id}
        expect(response).to have_http_status(:success)
      end
      
      it "renders the #show view" do
        get :show, {id: my_question.id}
        expect(response).to render_template :show
      end
      
      it "assigns my_question to @question" do
        get :show, {id: my_question.id}
        expect(assigns(:question)).to eq(my_question)
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
      
      it "instantaites @question" do
        get :new
        expect(assigns(:question)).not_to be_nil
      end
    end
    
    describe "POST create" do
      it "increases the number of Queations by 1" do
        expect{ post :create, {question: {title: "Title", body: "Body", resolved: false}}}.to change(Question,:count).by(1)
      end
      
      it "assigns the new question to @uestion" do
        post :create, {question: my_question.attributes}
        expect(assigns(:question)).to eq Question.last
      end
      
      it "redirects to the new questiion" do
        post :create, {question: my_question.attributes}
        expect(response).to redirect_to Question.last
      end
    end
    
    describe "GET edit" do
      it "returns http success" do
        get :edit, {id: my_question.id}
        expect(response).to have_http_status(:success)
      end
      
      it "renders the #edit view" do
        get :edit, {id: my_question.id}
        expect(response).to render_template :edit
      end
    end
    
    describe "PUT update" do
      it "update question with expected attributes" do
        new_title = RandomData.random_sentence
        new_body = RandomData.random_paragraph
        
        put :update, id: my_question.id, questiion: {title: new_title, body: new_body, resolced: false}
        
        update_question = assigns(:questiion)
        expect(update_question.id).to eq my_question.id
        expect(update_question.title).to eq new_title
        expect(update_question.body).to eq new_body
      end
      
      it "redirect to the update question" do
        new_title = RandomData.random_sentence
        new_body = RandomData.random_paragraph
        
        put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: true}
        expect(response).to redirect_to my_question
      end
    end
end