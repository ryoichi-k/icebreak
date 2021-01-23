class CommentsController < ApplicationController
    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(
        content: params[:content]
        )
        @comment.user_id = @current_user.id
        @comment.icebreak_id = params[:id]
        
        if @comment.save!
            flash[:notice] = "レビューの投稿が完了しました"
            redirect_to("/icebreaks/#{params.id}")
        else
            flash[:notice] = "レビューの投稿ができませんでした。"
            redirect_to("/icebreaks")  
        end
    end

    private
      def comment_params
          params.require(:comment).permit(:content)
      end
end
