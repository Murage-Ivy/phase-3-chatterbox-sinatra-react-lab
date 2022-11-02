class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Add routes
  # Gets all messages from the database
  get "/messages" do
    messages = Message.all
    # Returns a response that is in json format
    messages.to_json
  end

  # Creates a new record for a message in the database
  post "/messages" do
    message = Message.create(body: params[:body], username: params[:username])
    message.to_json
  end

  # Updates a message record when a user edits it
  patch "/messages/:id" do
    message = Message.find(params[:id])
    message.update(body: params[:body])
    message.to_json
  end

  # Deletes a message from the database
  delete "/messages/:id" do
    message = Message.find(params[:id])
    message.destroy
    message.to_json
  end
end
