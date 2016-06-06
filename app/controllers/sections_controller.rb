class SectionsController < ApplicationController
  
  layout "admin"
  
  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => 'Default'})
  end

  def create
    #Instantiate a new object using form parameters
    @section = Section.new(section_params)
    #Save the Object
    if @section.save
    #If save succeeds, redirect to the index action
      flash[:notice] = "Section Created successfully!"
      redirect_to(:action=>'index')
    else
    #If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    #Find an existing object using form parameters
    @section = Section.find(params[:id])
    #Update the Object
    if @section.update_attributes(section_params)
    #If update succeeds, redirect to the index action
      flash[:notice] = "section Updated successfully!"
      redirect_to(:action=>'show', :id => @section.id)
    else
    #If update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

   def delete
    @section = Section.find(params[:id])
  end
  
  def destroy
    section = Section.find(params[:id]).destroy
    #section.destroy
    flash[:notice] = "Section '#{section.name}' Deleted successfully!"
    redirect_to(:action => 'index')
  end
  
  private
    def section_params
    # same as using 'params[:subject]', except that it:
    # - raises an error if :subject is not present
    # - allows listed attributes to be mass-assigned
      params.require(:section).permit(:page_id, :name, :position, :visible, :content__type, :content)
    end
end
