class StocksController < ApplicationController

    def search
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock])
            if @stock
                @user = current_user
                render 'users/my_portfolio'
            else
                redirect_to myportfolio_path, alert: "You entered an invalid value."
            end
        else
            redirect_to myportfolio_path, alert: "You must enter a value."
        end            
    end
end