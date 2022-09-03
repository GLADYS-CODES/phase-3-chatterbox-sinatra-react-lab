class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes

#  returns an array of all messages as JSON, ordered by created_at in ascending order.
  get "/messages" do
    messages = Message.all.order(:created_at)
    messages.to_json
  end

 # reates a new message with a body and username from params, and returns the newly created post as JSON.

  post "/messages" do
    message = Message.create(body: params[:body], username: params[:username])
    message.to_json
  end

 
  #updates the body of the message using params, and returns the updated message as JSON.

patch "/messages/:id" do
  message =Message.find(params[:id])
  message.update(body: params[:body])
  message.to_json

  end


  #deletes the message from the database.

  delete "/messages/:id" do
    message = Message.find(params[:id])
    message.destroy
    message.to_json
  end
end
