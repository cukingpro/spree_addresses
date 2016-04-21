Spree::Api::AddressesController.class_eval do
  before_action :authenticate_user
  skip_before_action :find_order

  def create
    @address = Spree::Address.new(address_params)
    if @address.save!
      render "spree/api/addresses/show"
    else
      @status = [ { "messages" => "Address was not successfully created"}]
      render "spree/api/logger/log"
    end

  end

  def update
    @address = Spree::Address.find(params[:id])
    if @address.update(address_params)
      @status = [ { "messages" => "Address was successfully updated"}]
    else
      @status = [ { "messages" => "Address was not successfully updated"}]
    end
    render "spree/api/logger/log"
  end

  def index
    @addresses = Spree::Address.all
    render "spree/api/addresses/index"
  end

  def show
    @address = Spree::Address.find(params[:id])
    render "spree/api/addresses/show"
  end

  def destroy
    @address = Spree::Address.find(params[:id])
    @status = if @address.destroy
      [{ "messages" => "Address was successfully destroyed" }]
    else
      [{ "messages" => "Address was not successfully destroyed" }]
    end
    render "spree/api/logger/log"
  end

  def user_addresses
    @addresses = current_api_user.addresses
    render "spree/api/addresses/index"
  end


  private
  def address_params
    params.require(:address).permit(:first_name, :last_name, :phone, :address1, :district, :city, :user_id, :title)
  end
end
