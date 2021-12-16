class ClientsController < ApplicationController
    def show
        client = Client.find(params[:id])
        render json: client, serializer: ShowClientSerializer
    end
    def index
        clients = Client.all
        render json: clients
    end
    def update
        client = Client.find(params[:id])
        client.update!(client_params)
        render json: client, status: :accepted
    end
    private
    def client_params
        params.permit(:name, :age)
    end
end
