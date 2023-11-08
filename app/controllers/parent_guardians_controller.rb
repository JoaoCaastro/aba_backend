class ParentGuardiansController < ApplicationController

  def index
    @parent_guardians = ParentGuardian.all
    
    render json: @parent_guardians
  end
  
  def create
    @parent_guardian = ParentGuardian.new(parent_guardian_params)

    if @parent_guardian.save
      render json: @parent_guardian, status: :created      
    else
      render json: @parent_guardian.errors, status: :unprocessable_entity
    end        
  end

  def show
    @parent_guardian = ParentGuardian.find_by(id: params[:id])
    if @parent_guardian
      render json: @parent_guardian
    else
      render json: { error: 'Responsável não encontrado' }, status: :not_found
    end
  end

  def update
    @parent_guardian = ParentGuardian.find_by(id: params[:id])

    if @parent_guardian
      if @parent_guardian.update(parent_guardian_params)
        render json: @parent_guardian
      else
        render json: @parent_guardian.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Responsável não encontrado' }, status: :not_found
    end
  end

  def destroy
    @parent_guardian = ParentGuardian.find_by(id: params[:id])

    if @parent_guardian
      @parent_guardian.destroy
      render json: { message: 'Responsável removido com sucesso' }
    else
      render json: { error: 'Responsável não encontrado' }, status: :not_found
    end
  end
  
  
  private

  def parent_guardian_params
    params.require(:parent_guardian).permit(:parent_name, :cpf, :telephone, :email, :degree_of_kinship)
  end
  

end
