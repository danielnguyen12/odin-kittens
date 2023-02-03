class KittensController < ApplicationController
  before_action :set_kitten, only: [:show, :edit, :update, :destroy]

  def index
    @kittens = Kittens.all
  end

  def show
    render @kitten
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      redirect_to kittens_path, notice: 'Successfully created Kitten'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @kitten.update(kitten_params)
      redirect_to kittens_path, notice: 'Successfully updated Kitten'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten.destroy
    redirect_to kittens_path, notice: 'Kitten was deleted'
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

  def set_kitten
    @kitten = Kittens.find(params[:id])
  end
end
