class IcebreaksController < ApplicationController
    def index
        @icebreaks = Icebreak.all
    end

    def show
        @icebreak = Icebreak.find_by(id: params[:id])
    end
end
