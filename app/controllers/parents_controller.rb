class ParentsController < ApplicationController

  def index
    @parents = Parent.all
    
    render json: @parents
  end
  
  def create
    @parent = Parent.new(parent_params)

    if @parent.save
      render json: @parent, status: :created      
    else
      render json: @parent.errors, status: :unprocessable_entity
    end        
  end

  def show
    @parent = Parent.find_by(id: params[:id])
    if @parent
      render json: @parent
    else
      render json: { error: 'Responsável não encontrado' }, status: :not_found
    end
  end

  def update
    @parent = Parent.find_by(id: params[:id])

    if @parent
      if @parent.update(parent_params)
        render json: @parent
      else
        render json: @parent.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Responsável não encontrado' }, status: :not_found
    end
  end

  def destroy
    @parent = Parent.find_by(id: params[:id])

    if @parent
      @parent.destroy
      render json: { message: 'Responsável removido com sucesso' }
    else
      render json: { error: 'Responsável não encontrado' }, status: :not_found
    end
  end
  
  
  private

  def parent_params
    params.require(:parent).permit(:parent_name, :cpf, :telephone, :email, :degree_of_kinship)
  end
  

end
