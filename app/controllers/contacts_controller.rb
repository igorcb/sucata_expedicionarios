class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
    @product = params['product'].present? ? Product.find(params['product']) : nil
    @product_name = @product.nil? ? "" : @product.name
    @product_mark_category = @product.nil? ? "" : @product.mark.name + '-' + @product.category.name
  end

  def create
  	@contact = Contact.new(params.require(:contact).permit(:name, :email, :phone, :subject, :message))

  	if @contact.save!
  		ContactMailer.contact_message(params[:contact]).deliver
  		flash[:notice] = 'Menssagem enviada com sucesso'
  		redirect_to :action => 'new'
  		return
  	end

  	return :action => 'new'

  end
end
