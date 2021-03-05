class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [ :show ]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  # POST
  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :doses, :ingredients)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
