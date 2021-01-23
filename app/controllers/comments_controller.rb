class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @icebreak = Icebreak.find_by(params[:icebreak_id])
        binding.pry
        @comment = @icebreak.comments.new(
            content: params[:content]
        )
        #@comment = Comment.new(
        #content: params[:content]
        #)
        @comment.user_id = @current_user.id
        #@comment.icebreak_id = params[:id]
        @comment.save!
        redirect_to("/icebreaks/1")
    
        #if @comment.save!
            #flash[:notice] = "レビューの投稿が完了しました"
            #redirect_to("/icebreaks/#{params.id}")
        #else
            #flash[:notice] = "レビューの投稿ができませんでした。"
            #redirect_to("/icebreaks")  
        
    end

    
end
