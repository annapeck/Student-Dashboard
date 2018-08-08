class DojosController < ApplicationController
  def index
  	@dojos = Dojo.all
  end
  def create
  	@dojo = Dojo.create(branch: params[:branch], street: params[:street], city: params[:city], state: params[:state])
  	redirect_to '/dojos'

  	if @dojo.save
  		flash[:success] = "You did it!"
  	else 
  		flash[:danger] = "Please check the form for errors."
  	end
  end
  def show
  	@dojo = Dojo.find(params[:id])
    @student = Dojo.find(params[:id]).students
  end
  def edit
  	@dojo = Dojo.find(params[:id])
  end
  def update
  	dojo = Dojo.find(params[:id])
  	dojo.branch = params[:branch]
  	dojo.street = params[:street]
  	dojo.city = params[:city]
  	dojo.state = params[:state]
  	dojo.save
  	redirect_to '/dojos'
  end

   def destroy
  	dojo = Dojo.find(params[:id])
  	dojo.destroy
  	redirect_to '/dojos'
  end
  private
    def dojo
      params.require(:dojo).permit(:branch, :city, :city, :state)
    end
end
