class CommentsController < ApplicationController

  def index
    render json: Comment.all.map { |comment| comment.body }
  end

end
