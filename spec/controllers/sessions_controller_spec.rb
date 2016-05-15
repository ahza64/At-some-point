require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
   describe "#new" do
       it "saves a new user" do
         # item = Item.create({size:'s', color:'blue', status:'unsold'})
         # get :new, id: item.id
         expect(response).to render_template(:new)
       end
     end
   describe "#create" do
      it "verifies the user information and logs in user"

   end
   describe "#destroy" do
      it "logs user out, ends user session"
   end

end
