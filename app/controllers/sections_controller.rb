class SectionsController < ApplicationController

  layout "admin"
  before_action :confirm_login_action
  before_action :find_page

  def index
    @sections = @page.sections.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:page_id => @page.id)
    @pages = @page.subject.pages.sorted
    @section_count = Section.count +  1
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully"
      redirect_to(:action => 'index', :page_id => @page.id)
    else
      @pages = Page.order("position ASC")
      @section_count = Section.count + 1
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @pages = Page.order("position ASC")
    @section_count = Section.count
  end

  def update
    @section = Section.find(params[:id])
    puts "reached"
    if @section.update_attributes(section_params)
      flash[:notice] = "Section updated successfully"
      redirect_to(:action => 'show', :id => @section.id, :page_id => @page.id)
    else
      @pages = Page.order("position ASC")
      @section_count = Section.count
      render('edit')
    end
  end

  def delete
    @section =Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] = "Section '#{@section.name}' deleted successfully"
    redirect_to(:action => 'index', :page_id => @page.id)
  end

  private

    def section_params
      params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
    end

    def find_page
      @page = Page.find(params[:page_id])
    end
    
end