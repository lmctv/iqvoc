class CollectionsController < ApplicationController
  skip_before_filter :require_user

  def index
    authorize! :read, Iqvoc::Collection.base_class

    respond_to do |format|
      format.html do
        @collections = Iqvoc::Collection.base_class.with_pref_labels.all.sort{ |a, b| a.label.to_s <=> b.label.to_s }
      end
      format.json do
        @collections = Iqvoc::Collection.base_class.with_pref_labels.merge(Label::Base.by_query_value("#{params[:query]}%"))
        response = []
        @collections.each { |c| response << collection_widget_data(c) }
        render :json => response
      end
    end
  end

  def show
    @collection = Iqvoc::Collection.base_class.by_origin(params[:id]).last
    raise ActiveRecord::RecordNotFound.new("Could not find Collection for id '#{params[:id]}'") unless @collection

    authorize! :read, @collection
  end

  def new
    authorize! :create, Iqvoc::Collection.base_class

    @collection = Iqvoc::Collection.base_class.new
    build_note_relations
  end

  def create
    authorize! :create, Iqvoc::Collection.base_class

    @collection = Iqvoc::Collection.base_class.new(params[:concept])

    if @collection.save
      flash[:notice] = I18n.t("txt.controllers.collections.save.success")
      redirect_to collection_path(@collection, :lang => I18n.locale)
    else
      flash.now[:error] = I18n.t("txt.controllers.collections.save.error")
      render :new
    end
  end

  def edit
    @collection = Iqvoc::Collection.base_class.by_origin(params[:id]).last
    raise ActiveRecord::RecordNotFound.new("Could not find Collection for id '#{params[:id]}'") unless @collection

    authorize! :update, @collection
    build_note_relations
  end

  def update
    @collection = Iqvoc::Collection.base_class.by_origin(params[:id]).last
    raise ActiveRecord::RecordNotFound.new("Could not find Collection for id '#{params[:id]}'") unless @collection

    authorize! :update, @collection

    if @collection.update_attributes(params[:concept])
      flash[:notice] = I18n.t("txt.controllers.collections.save.success")
      if @collection.circular_errors.length > 0:
        flash[:error] = I18n.t("txt.controllers.collections.circular_error") %
            @collection.circular_errors.map { |c| c.label }.join("\n")
      end
      redirect_to collection_path(@collection, :lang => I18n.locale)
    else
      flash.now[:error] = I18n.t("txt.controllers.collections.save.error")
      render :edit
    end
  end

  def destroy
    @collection = Iqvoc::Collection.base_class.by_origin(params[:id]).last
    raise ActiveRecord::RecordNotFound.new("Could not find Collection for id '#{params[:id]}'") unless @collection

    authorize! :destroy, @collection

    if @collection.destroy
      flash[:notice] = I18n.t("txt.controllers.collections.destroy.success")
      redirect_to collections_path(:lang => I18n.locale)
    else
      flash.now[:error] = I18n.t("txt.controllers.collections.destroy.error")
      render :action => :show
    end
  end

  private

  def build_note_relations
    @collection.note_skos_definitions.build if @collection.note_skos_definitions.empty?
  end

end
