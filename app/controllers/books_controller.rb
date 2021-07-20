class BooksController < ApplicationController
  def index
    @books = Book.includes(:favorites).sort{|a,b| b.favorites.count <=> a.favorites.count}
    @book = Book.new
    @user = current_user
    #from = Time.current.at_beginning_of_day
    #to = (from + 6.day).at_end_of_day
    #@books = Book.joins(:favorites).where(favorites: {created_at: from...to}).group(:id).order("count(*) desc")
  end

  def show
    @newbook = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @comment = Comment.new
    @comments = @book.comments
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
