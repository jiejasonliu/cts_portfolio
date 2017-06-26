class PortfoliosController < ApplicationController
  def index 
    @portfolio_items = Portfolio.ruby_on_rails
  end
  
  def angular
    @angular_portfolio_items = Portfolio.angular
  end
  
  def new
    @portfolio_item = Portfolio.new
  end
  
  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
      end
    end
  end
  
  def edit 
     @portfolio_item = Portfolio.find(params[:id])
  end
  
  def update
    @portfolio_item = Portfolio.find(params[:id])
    
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def show 
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def destroy
    # Performs the lookup -- by ID
    @portfolio_item = Portfolio.find(params[:id])
    
    # Destroys the item with callback protection.
    @portfolio_item.destroy
    
    # Redirect to Portfolio URL.
    respond_to do |format| 
      format.html { redirect_to portfolios_path, notice: 'Record was removed.' }
    end
  end
  
end