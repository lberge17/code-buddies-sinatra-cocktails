class RegistrationsController < ApplicationController

    get '/signup' do
        redirect_if_logged_in
        erb :"registrations/signup"
    end

    post '/signup' do
        redirect_if_logged_in
        user = User.new(params["user"])
        if user.save
            session["user_id"] = user.id
            redirect "/"
        else
            flash[:messages] = user.errors.full_messages
            erb :"registrations/signup"
        end
    end

    # get '/account/edit' do
    #     redirect_if_not_logged_in
    # end

    # patch '/account/edit' do
    #     redirect_if_not_logged_in
    # end

    delete '/users/:id' do
        redirect_if_not_logged_in
        if session["user_id"] == params[:id]
            current_user.destroy
            session.delete("user_id")
            redirect "/login"
        else
            redirect "/forbidden"
        end
    end
    
end