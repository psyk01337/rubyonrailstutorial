class PagesController < ApplicationController

  layout "admin"
  
  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({:name => 'Default'})
  end

  def create
    #Instantiate a new object using form parameters
    @page = Page.new(page_params)
    #Save the Object
    if @page.save
    #If save succeeds, redirect to the index action
      flash[:notice] = "Page Created successfully!"
      redirect_to(:action=>'index')
    else
    #If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    #Find an existing object using form parameters
    @page = Page.find(params[:id])
    #Update the Object
    if @page.update_attributes(page_params)
    #If update succeeds, redirect to the index action
      flash[:notice] = "Page Updated successfully!"
      redirect_to(:action=>'show', :id => @page.id)
    else
    #If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

   def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    page = Page.find(params[:id]).destroy
    #page.destroy
    flash[:notice] = "Page '#{page.name}' Deleted successfully!"
    redirect_to(:action => 'index')
  end
  
  private
    def page_params
    # same as using 'params[:subject]', except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
      params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
    end
end
