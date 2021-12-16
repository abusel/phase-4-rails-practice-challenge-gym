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

    private
    def find_gym
        Gym.find(params[:id])
    end
     def render_not_found_response
        render json: {error: "Gym not found"}, status: :not_found
    end
end
