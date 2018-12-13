class OrdersController < ApplicationController
    def destroy
        @order = Order.find(params[:id])
        @order.destroy
        respond_to do |format|
          format.html { redirect_to carts_url }
          format.json { head :no_content }
        end
      end
end
