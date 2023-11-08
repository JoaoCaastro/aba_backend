class ClientesController < ApplicationController

  def index
    @clientes = Cliente.all
    
    render json: @clientes
  end
  
  # def create
  #   @cliente = Cliente.new(cliente_params)

  #   if @cliente.save
  #     render json: @cliente, status: :created      
  #   else
  #     render json: { error: @cliente.errors.full_menssages }, status: :unprocessable_entity
  #   end        
  # end

  def create
    ActiveRecord::Base.transaction do
      # Crie o cliente
      @cliente = Cliente.new(cliente_params)
  
      # Crie o responsável e associe ao cliente
      parent_guardian_params = cliente_params.delete(:parent_guardians_attributes)
      @cliente.parent_guardians.build(parent_guardian_params)
  
      @cliente.save!
  
      render json: { cliente: @cliente, parent_guardian: @cliente.parent_guardians }, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  # def show
  #   @cliente = Cliente.find_by(id: params[:id])
  #   if @cliente
  #     render json: @cliente
  #   else
  #     render json: { error: 'Cliente não encontrado' }, status: :not_found
  #   end
  # end

  def show
    @cliente = Cliente.find_by(id: params[:id])

    if @cliente
      render json: { cliente: @cliente, parent_guardians: @cliente.parent_guardians }
    else
      render json: { error: 'Cliente não encontrado' }, status: :not_found
    end
  end

  def update
    @cliente = Cliente.find_by(id: params[:id])

    if @cliente
      if @cliente.update(cliente_params)
        render json: @cliente
      else
        render json: @cliente.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Cliente não encontrado' }, status: :not_found
    end
  end

  def destroy
    @cliente = Cliente.find_by(id: params[:id])

    if @cliente
      @cliente.destroy
      render json: { message: 'Cliente removido com sucesso' }
    else
      render json: { error: 'Cliente não encontrado' }, status: :not_found
    end
  end
  
  
  private

  def cliente_params
    params.require(:cliente).permit(:name, :brithday, :gender, :cpf, :telephone, :email, :education_level, :medical_informations, :medicines_in_use, :processing_information, parent_guardians_attributes: [:parent_name, :cpf, :degree_of_kinship, :email, :telephone])
  end
  

end
