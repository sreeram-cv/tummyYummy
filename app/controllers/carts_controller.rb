class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
    remember_token = User.digest(cookies[:remember_token])
    @user = User.find_by(remember_token: remember_token)
    
  end

 

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        
        format.html { redirect_to @cart}
        #flash[:success] = "Items added to cart successfully"
        format.json { render action: 'show', status: :created, location: @cart }
      end
    end
  end

  def ordersNew
    remember_token = User.digest(cookies[:remember_token])
    @user = User.find_by(remember_token: remember_token)
    curcart = Cart.find_by(id:params[:cart_id])
    items = curcart[:items];
    @order = Order.new({items:items,user_id:params[:user_id],agent_id:params[:agent_id]});
    @order.save();
    flash[:success] = "Items ordered successfully"
    redirect_to @user
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:agent_id, :items,:user_id,:cart_id)
    end
end
