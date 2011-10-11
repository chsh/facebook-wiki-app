class ContentPagesController < ApplicationController
  before_filter :lookup_parent
#  before_filter :content_page_from_id, only: %w(show edit update destroy)

  # GET /content_pages
  # GET /content_pages.json
  def index
    # show top page
    @content_page = content.default_page
    if @content_page
      render text: content.render, layout: true
    else
      redirect_to action: 'new', id: content.content[:default_name]
    end
  end

  # GET /content_pages/1
  # GET /content_pages/1.json
  def show
    if @content_page
      render layout: true
    else
      @content_page = content.pages.new(name: params[:id].to_s.gsub('%2F', '/').gsub('%25', '%'))
      render action: 'new', layout: true
    end
  end

  # GET /content_pages/new
  # GET /content_pages/new.json
  def new
    @content_page = content.pages.create(params[:content_page])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @content_page }
    end
  end

  # GET /content_pages/1/edit
  def edit
    @app = @owner.app
  end

  # POST /content_pages
  # POST /content_pages.json
  def create
    @content_page = content.pages.new(params[:content_page])
    if @content_page.save
      owner = @content_page.content.ownable
      if owner.is_a?(PageApp)
        redirect_to page_app_content_page_path(page_app_id: owner.id, id: @content_page.name.gsub('%', '%25').gsub('/', '%2F'))
      else # owner is Page
        redirect_to page_content_page_path(page_id: owner.id, id: @content_page.name.gsub('%', '%25').gsub('/', '%2F'))
      end
    else
      render action: 'new'
    end
  end

  # PUT /content_pages/1
  # PUT /content_pages/1.json
  def update
    if @content_page.update_attributes(params[:content_page])
      owner = @content_page.content.ownable
      if owner.is_a?(PageApp)
        redirect_to page_app_content_page_path(page_app_id: owner.id, id: @content_page.name.gsub('%', '%25').gsub('/', '%2F'))
      else # owner is Page
        redirect_to page_content_page_path(page_id: owner.id, id: @content_page.name.gsub('%', '%25').gsub('/', '%2F'))
      end
    else
      render action: 'edit'
    end
  end

  # DELETE /content_pages/1
  # DELETE /content_pages/1.json
  def destroy
    @content_page.destroy
    redirect_to action: 'index'
  end

  private
  def page?
    @page ? true : false
  end
  def page_app?
    @page_app ? true : false
  end
  def owner
    @owner ||= (@page || @page_app)
  end
  def content
    owner.content
  end
  def lookup_parent
    if params[:page_id]
      @page = Page.find params[:page_id]
      @content_page = ContentPage.find_by_name(params[:id])
    elsif params[:page_app_id]
      @page_app = PageApp.find params[:page_app_id]
      @content_page = ContentPage.find_by_name(params[:id])
    else
      @content_page = ContentPage.find(params[:id])
      @owner = @content_page.content.ownable
      if @owner.is_a?(Page)
        @page = @owner
      else
        @page_app = @owner
      end
    end
    @app = owner.app
  end
end
