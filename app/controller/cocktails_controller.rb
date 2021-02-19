class CocktailsController < ApplicationController
    get '/cocktails' do
        redirect_if_not_logged_in
        @cocktails = current_user.cocktails
        erb :'cocktails/index'
    end

    get '/cocktails/search' do
        redirect_if_not_logged_in
        if params["search"]
            @cocktails = CocktailAPI.search(params["search"])
            erb :'cocktails/results'
        else
            erb :'cocktails/search'
        end
    end

    get '/cocktails/new' do
        redirect_if_not_logged_in
        erb :'cocktails/new'
    end

    post '/cocktails' do
        redirect_if_not_logged_in
        cocktail = Cocktail.new(params["cocktail"])
        if cocktail.save
            redirect "cocktails/#{cocktail.id}"
        else
            flash[:messages] = cocktail.full_messages
            erb :'cocktails/new'
        end
    end

    get '/cocktails/:id' do
        redirect_if_not_logged_in
        set_cocktail
        erb :'cocktails/show'
    end

    get '/cocktails/:id/edit' do
        redirect_if_not_logged_in
        set_cocktail
        :'cocktails/edit'
    end

    patch '/cocktails/:id' do
        redirect_if_not_logged_in
        set_cocktail
        if @cocktail.user_id == session["user_id"]
            @cocktail.update(params["cocktail"])
            redirect "/cocktails/#{@cocktail.id}"
        else
            redirect "/forbidden"
        end
    end

    delete "/cocktails/:id" do
        redirect_if_not_logged_in
        set_cocktail
        if @cocktail.user_id == session["user_id"]
            @cocktail.destroy
            redirect "/cocktails"
        else
            redirect "/forbidden"
        end
    end

    private

    def set_cocktail
        @cocktail = Cocktail.find_by_id(params[:id])
    end
end