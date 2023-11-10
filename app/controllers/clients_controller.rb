class ClientsController < ApplicationController

  def index
    @clients = Client.all
    
    render json: @clients
  end
  
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created      
    else
      render json: { error: @client.errors.full_menssages }, status: :unprocessable_entity
    end        
  end


  # def show
  #   @client = Client.find_by(id: params[:id])
  #   if @client
  #     render json: @client
  #   else
  #     render json: { error: 'Cliente não encontrado' }, status: :not_found
  #   end
  # end

  def show
    @client = Client.find_by(id: params[:id])

    if @client
      render json: { client: @client, parent_guardians: @client.parents }
    else
      render json: { error: 'Cliente não encontrado' }, status: :not_found
    end
  end

  def update
    @client = Client.find_by(id: params[:id])

    if @client
      if @client.update(client_params)
        render json: @client
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Cliente não encontrado' }, status: :not_found
    end
  end

  def destroy
    @client = Client.find_by(id: params[:id])

    if @client
      @client.destroy
      render json: { message: 'Cliente removido com sucesso' }
    else
      render json: { error: 'Cliente não encontrado' }, status: :not_found
    end
  end
  
  
  private

  def client_params
    params.require(:client).permit(:name, :brithday, :gender, :cpf, :telephone, :email, :education_level, :medical_informations, :medicines_in_use, :processing_information, parents_attributes: [:parent_name, :cpf, :degree_of_kinship, :email, :telephone])
  end
  

end
