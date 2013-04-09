class UsersController < ApplicationController
  def index
    @per_page = 50
    @count = User.by_karma.count
    if @count % @per_page == 0
      @num_pages = @count / @per_page
    else
      @num_pages = @count / @per_page + 1
    end 
    @current_page = params[:page].to_i
    
    if @current_page > 2 && @current_page < (@num_pages - 1)
      @prev = @current_page - 1
      @page_1 = @current_page - 2
      @page_2 = @current_page - 1
      @page_3 = @current_page
      @page_4 = @current_page + 1
      @page_5 = @current_page + 2
      @next = @current_page + 1
    elsif @current_page <= 2
      @page_1 = 1
      @page_2 = 2
      @page_3 = 3
      @page_4 = 4
      @page_5 = 5
      @next = @current_page + 1
    else
      @prev = @current_page - 1
      @page_1 = @num_pages - 4
      @page_2 = @num_pages - 3
      @page_3 = @num_pages - 2
      @page_4 = @num_pages - 1
      @page_5 = @num_pages
    end

    @users = User.page(@current_page, @per_page)
  end
end
