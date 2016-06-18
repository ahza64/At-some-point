require 'rails_helper'

RSpec.describe UsersController, type: :controller do
   describe "#new" do
      it "should render new" do
         get :new
         expect(response).to render_template(:new)
      end
   end

   describe "#create" do
      it "will make a user" do
         post :create, user:{email:"bob@test.com", username:"bob", location:"sf", password:"bobtests"}
         user = User.find_by(username:"bob")
         expect(user).not_to be_nil
         expect(response).to redirect_to user_path(user)
      end
      it "doesn't make a user when email is missing" do
         post :create, user:{email:"", username:"bob", location:"sf", password:"bobtests"}
         user = User.find_by(username:"bob")
         expect(user).to be_nil
         expect(response).to render_template(:new)
      end
      it "doesn't make a user when email is missing" do
         post :create, user:{username:"bob", location:"sf", password:"bobtests"}
         user = User.find_by(username:"bob")
         expect(user).to be_nil
         expect(response).to render_template(:new)
      end
      it "doesn't make a user when username is missing" do
         expect(User.find_by(username:"bob")).to be_nil
         post :create, user:{email:"bob@test.com", username:"", location:"sf", password:"bobtests"}
         expect(User.find_by(username:"bob")).to be_nil
         expect(User.find_by(email:"bob@test.com")).to be_nil
         expect(response).to render_template(:new)
      end
      it "doesn't make a user when username is missing" do
         post :create, user:{email:"bob@test.com", location:"sf", password:"bobtests"}
         user = User.find_by(username:"bob")
         user = User.find_by(email:"bob@test.com")
         expect(user).to be_nil
         expect(response).to render_template(:new)
      end
      it "doesn't make a user when location is missing" do
         post :create, user:{email:"bob@test.com", username:"bob", location:"", password:"bobtests"}
         user = User.find_by(username:"bob")
         expect(user).to be_nil
         expect(response).to render_template(:new)
      end
      it "doesn't make a user when location is missing" do
         post :create, user:{email:"bob@test.com", username:"bob", password:"bobtests"}
         user = User.find_by(username:"bob")
         expect(user).to be_nil
         expect(response).to render_template(:new)
      end
      it "doesn't make a user when password is missing" do
         post :create, user:{email:"bob@test.com", username:"bob", location:"sf", password:""}
         user = User.find_by(username:"bob")
         expect(user).to be_nil
         expect(response).to render_template(:new)
      end
      it "doesn't make a user when password is missing" do
         post :create, user:{email:"bob@test.com", username:"bob", location:"sf"}
         user = User.find_by(username:"bob")
         expect(user).to be_nil
         expect(response).to render_template(:new)
      end
   end

   describe "#show" do
      let(:guy) {User.create(username:"guy", email:"guy@test.com", location:"sf", password:"guytests")}
      let(:bob) {User.create(username:"bob", email:"bob@test.com", location:"sf", password:"bobtests")}

      let(:signed_in_user) {bob}

      before do
         allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(signed_in_user)
      end

      it "will show profile when logged in" do
         get :show, id:bob.id
         expect(response).to render_template(:show)
      end

      it "doesn't show other users profile when logged in" do
         get :show, id:guy.id
         expect(response).to redirect_to(home_path)
      end

      it "doesn't see user profile when logged out" do
         signed_in_user=nil
         get :show, id:guy.id
         expect(response).to redirect_to(home_path)
      end

   end
end
