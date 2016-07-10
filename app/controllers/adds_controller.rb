class AddsController < ApplicationController
  def index
    @adds = Add.all
  end

  def show
    @add = Add.find(params[:id])
  end

  def new
    @add = Add.new
  end

  def create
    @add = Add.new
    @add.title = params[:add][:title]
    @add.copy = params[:add][:copy]
    @add.price = params[:add][:price]
    
    if @add.save
      flash[:notice] = "Advertisement was saved."
      redirect_to @add
    else
      flash[:error] = "There was an error saving the advertisement. Please try again."
      render :new
    end
  end
end
