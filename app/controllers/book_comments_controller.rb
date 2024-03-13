# frozen_string_literal: true

class BookCommentsController < ApplicationController
  before_action :set_book_comment, only: %i[show edit update destroy]

  # GET /book_comments or /book_comments.json
  def index
    redirect_to books_path
  end

  # GET /book_comments/1 or /book_comments/1.json
  def show; end

  # GET /book_comments/new
  def new
    @book_comment = BookComment.new
    @book = Book.find(params[:book_id].to_i)
  end

  # GET /book_comments/1/edit
  def edit; end

  # POST /book_comments or /book_comments.json
  def create
    @book_comment = BookComment.new(book_comment_params)

    respond_to do |format|
      if @book_comment.save
        format.html { redirect_to book_comment_url(@book_comment), notice: 'Book comment was successfully created.' }
        format.json { render :show, status: :created, location: @book_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_comments/1 or /book_comments/1.json
  def update
    respond_to do |format|
      if @book_comment.update(book_comment_params)
        format.html { redirect_to book_comment_url(@book_comment), notice: 'Book comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_comments/1 or /book_comments/1.json
  def destroy
    @book_comment.destroy

    respond_to do |format|
      format.html { redirect_to book_comments_url, notice: 'Book comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book_comment
    @book_comment = BookComment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_comment_params
    params.require(:book_comment).permit(:book_id, :user_id, :content)
  end
end
