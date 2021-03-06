class DebatesController < ApplicationController

  def index
    @debates = Debate.all
  end

  def show
    @debate = Debate.find(params[:id])
    if @debate.comments
      @agree_comments = @debate.comments.where(agree: true)
      @disagree_comments = @debate.comments.where(agree: false)
    end
  end

  def new
    @debates = Debate.new
  end

  def create
    @debate = Debate.new(debate_params)

    if @debate.save
      redirect_to @debate, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def debate_params
    params.require(:debate).permit(:title, :body, )
  end

end
