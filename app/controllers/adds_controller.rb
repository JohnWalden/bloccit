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
  
  end
end
