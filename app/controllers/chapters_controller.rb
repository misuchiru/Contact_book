class ChaptersController < ApplicationController
  before_action :find_chapter, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_required
  def index
    @chapters = Chapter.all
  end

  def new
    @chapter = Chapter.new
  end

  def create
    @chapter = Chapter.new(chapter_params)
    if @chapter.save
      redirect_to chapters_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @chapter.update(chapter_params)
      redirect_to chapters_path
    else
      render :edit
    end
  end

  def destroy
    @chapter.destroy if @chapter
    redirect_to chapters_path
  end

  private
  def find_chapter
    @chapter = Chapter.find_by(id: params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(:title)
  end
end
