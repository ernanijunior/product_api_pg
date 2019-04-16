class Api::V1::StocksController < Api::V1::ApiController
    before_action :set_stock, only: [:show, :update, :destroy]
    before_action :require_authorization!, only: [:show, :update, :destroy]
  
    # GET /api/v1/stocks.json
    def index
      @stocks = current_user.stocks
  
      render json: @stocks
    end
  
    # GET /api/v1/contacts/1
    def show
      render json: @stock
    end
  
    # POST /api/v1/contacts
    def create
      @stock = Stocks.new(stock_params.merge(user: current_user))
  
      if @stock.save
        render json: @stock, status: :created
      else
        render json: @stock.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /api/v1/contacts/1
    def update
      if @stock.update(stock_params)
        render json: @stock
      else
        render json: @stock.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /api/v1/contacts/1
    def destroy
      @stock.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_stock
        @stock = Stock.find(params[:id])
      end
  
      # Only allow a trusted parameter "white list" through.
      def stock_params
        params.require(:stock).permit(:provider, :name, :email, :description, :price, :amount)
      end
  
      def require_authorization!
        unless current_user == @stock.user
          render json: {}, status: :forbidden
        end
      end
  end
  