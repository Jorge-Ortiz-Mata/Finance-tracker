class User < ApplicationRecord
    has_many :user_stocks
    has_many :stocks, through: :user_stocks
    has_many :friendships
    has_many :friends, through: :friendships

    validates :username, presence: true
    validates :password, presence: true
    validates :password_confirmation, presence: true
    has_secure_password

    def stock_already_tracked?(ticker_symbol)
        stock = Stock.check_db(ticker_symbol)
        return false unless stock
        stocks.where(id: stock.id).exists?
    end

    def under_stock_limit?
        stocks.count < 4
    end

    def can_track_stock?(ticker_symbol)
        under_stock_limit? && !stock_already_tracked?(ticker_symbol)
    end

 # ------------------------- Search friend ------------------

    def self.look_friend_up(friend)
        @people = where("username like ?", "%#{friend}%")
        if !(@people.empty?)
            return @people
        else
            return nil
        end
    end
    
end
