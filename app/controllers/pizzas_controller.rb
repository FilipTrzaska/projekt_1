class PizzasController < ApplicationController
    before_action :find_pizza, only: [:show, :edit, :update, :destroy]
    
    def index
        @pizzas = Pizza.all.order("created_at DESC")
    end
    
    def new
        @pizza = Pizza.new
    end
    
    def show
    end
    
    def edit
        
    end
    
    def update
        if @pizza.update(pizza_params)
            redirect_to pizza_path(@pizza)
        else
            render  'edit'
        end
    end
    
    def destroy
        @pizza.destroy
        redirect_to root_path
    end
    
    def create
        @pizza = Pizza.new(pizza_params)
        
        if @pizza.save
            redirect_to root_path
        else
            render 'new'
        end
        
    end
    
    private
    
    def pizza_params
        params.require(:pizza).permit(:title, :description, :author)
    end
    
    def find_pizza
        @pizza = Pizza.find(params[:id])
    end
end
