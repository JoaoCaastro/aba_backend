class ProtocolsController < ApplicationController
   # GET /protocols
   def index
    @client = Client.find(params[:client_id])
    @protocols = @client.protocols

    render json: @protocols
  end

  # GET /protocols/1
  def show
    @client = Client.find(params[:client_id])
    @protocol = @client.protocols.find_by(id: params[:id])
  
    if @protocol.present?
      render json: @protocol
    else
      render json: { error: 'Protocolo não encontrado' }, status: :not_found
    end
  end

  # POST /protocols
  def create
    @client = Client.find(params[:client_id])
    protocols_params = params.require(:protocols).map { |p| p.permit(:name, :status) }
  
    created_protocols = []
    failed_protocols = []
  
    protocols_params.each do |protocol_params|
      protocol = @client.protocols.build(protocol_params)
  
      if protocol.save
        created_protocols << protocol
      else
        failed_protocols << { protocol: protocol_params, errors: protocol.errors.full_messages }
      end
    end
  
    if failed_protocols.empty?
      render json: created_protocols, status: :created
    else
      render json: { failed_protocols: failed_protocols }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /protocols/1
  def update
    @client = Client.find(params[:client_id])
    @protocol = @client.protocols.find_by(id: params[:id])
  
    if @protocol.present?
      if @protocol.update(protocol_params)
        render json: @protocol
      else
        render json: @protocol.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Protocolo não encontrado ou não está associado ao cliente' }, status: :not_found
    end
  end

  # DELETE /protocols/1
  def destroy
    @client = Client.find(params[:client_id])
    @protocol = @client.protocols.find_by(id: params[:id])
    
    if @protocol.present?
      if @protocol.destroy
        render json: { message: 'Protocolo excluído com sucesso' }
      else
        render json: @protocol.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Protocolo não encontrado ou não está associado ao cliente' }, status: :not_found
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def protocol_params
      params.require(:protocol).permit(:name, :status)
    end
end
