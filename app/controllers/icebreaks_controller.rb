class IcebreaksController < ApplicationController
    def index #アイスブレイク一覧
        @icebreaks = Icebreak.all
    end

    def show #アイスブレイク詳細
        @icebreak = Icebreak.find_by(id: params[:id])
        @user = User.find_by(id: @icebreak.user_id) 
        @comments = @icebreak.comments
        @comment = Comment.new
        #@comment = Comment.find_by(id: params[:id])
        #@icebreak = Icebreak.find_by(id: @comment.icebreak_id)
    end

    def create
        @icebreak = Icebreak.new(
          name: params[:name],
          description: params[:description]
        )
        @icebreak.user_id = @current_user.id
        @icebreak.save
        redirect_to("/icebreaks")
    end

    def edit
        @icebreak = Icebreak.find_by(id: params[:id])
    end

    def update
        @icebreak = Icebreak.find_by(id: params[:id])
        @icebreak.name = params[:name]
        @icebreak.description = params[:description]
        if @icebreak.save
            flash[:notice] = "アイスブレイク情報を更新しました"
            redirect_to("/icebreaks/#{@icebreak.id}")
        else
            render("icebreaks/edit")
        end
    end

    def destroy
        @icebreak = Icebreak.find_by(id: params[:id])
        @icebreak.destroy
        redirect_to("/icebreaks")
    end
end
