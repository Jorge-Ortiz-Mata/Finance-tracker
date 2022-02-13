class UserStocksController < ApplicationController

    def create
        stock = Stock.check_db(params[:ticker])
        if stock.blank?
            stock = Stock.new_lookup(params[:ticker])
            stock.save
        end
        @user_stock = UserStock.create(user: current_user, stock: stock) 
        redirect_to myportfolio_path, notice: "Object add to your list."
    end

    def destroy
        stock = Stock.find(params[:id])
        user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
        user_stock.destroy
        redirect_to myportfolio_path, notice: "Stock: #{user_stock.user_id}, #{user_stock.stock_id} was removed from the portfolio."
    end

end
