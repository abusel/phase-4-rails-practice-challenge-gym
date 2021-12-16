class GymsController < ApplicationController
    def show
        gym = find_gym
        render json: gym
    end

    def destroy
        gym = find_gym
        gym.destroy
        head :no_content, status: :gone
    end

    def index
        if params[:client_id]
            client = Client.find(params[:client_id])
            gyms = client.gyms
        else
            gyms = Gym.all
        end
        render json: gyms
    end

    def update
        gym = find_gym
        gym.update!(gym_params)
        render json:gym, status: :accepted
    end

    private
    def find_gym
        Gym.find(params[:id])
    end
     def render_not_found_response
        render json: {error: "Gym not found"}, status: :not_found
    end
    def gym_params
        params.permit(:name, :address)
    end
end
