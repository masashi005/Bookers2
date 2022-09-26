class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
      flash[:notice] = "successfully create new book"
      redirect_to book_path(@book[:id])
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    @user = User.find(@book.user.id)

    if @user != current_user
      redirect_to books_path
    else
      render :layout => 'home_layout'
    end

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully update"
      redirect_to book_path(@book)
    else
      @user = current_user
      render :edit, :layout => 'home_layout'

    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "successfully deleat"
    redirect_to books_path
  end


  private

  def book_params

    params.require(:book).permit(:title, :body)

  end

end
