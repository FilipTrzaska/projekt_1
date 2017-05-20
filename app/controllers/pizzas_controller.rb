class PizzasController < ApplicationController
    before_action :find_pizza, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:category].blank?
            @pizzas = Pizza.all.order("created_at DESC")
        else
            @category_id = Category.find_by(name: params[:category]).id
            @pizzas = Pizza.where(:category_id => @category_id).order("created_at DESC")
        end
    end
    
    def show
    end
    
    def new
        @pizza = current_user.pizzas.build
        @categories = Category.all.map{ |c| [c.name, c.id] }
    end
    
    def create
        
        @pizza = current_user.pizzas.build(pizza_params)
        @pizza.category_id = params[:category_id]
        
        if @pizza.save
            redirect_to root_path
        else
            render 'new'
        end
        
    end
    
    def edit
        @categories = Category.all.map{ |c| [c.name, c.id] }
    end
    
    def update
        @pizza.category_id = params[:category_id]
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
    
    private
    
    def pizza_params
        params.require(:pizza).permit(:title, :description, :author, :category_id)
    end
    
    def find_pizza
        @pizza = Pizza.find(params[:id])
    end
end
