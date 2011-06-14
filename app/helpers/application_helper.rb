module ApplicationHelper
  # in ApplicationHelper
  def show_link(object, params = {}, content = "Show")
    link_to(content, {:action => :show, :controller => controller_name(object), :id => object.id}.merge(params)) if can?(:read, object)
  end

  def edit_link(object, params = {}, content = "Edit")
    link_to(content, {:action => :edit, :controller => controller_name(object), :id => object.id}.merge(params)) if can?(:update, object)
  end

  def destroy_link(object, params = {}, content = "Destroy")
    link_to(content, {:action => :destroy, :controller => controller_name(object), :id => object.id}.merge(params), :method => :delete, :confirm => "Are you sure?") if can?(:destroy, object)
  end

  def create_link(object, params = {}, content = "New")
    if can?(:create, object)
      link_to(content, {:action => :new, :controller => controller_name(object)}.merge(params))
    end
  end
  def show_edit_destroy_links(object, params = {}, show_content = "Show", edit_content = "Edit", destroy_content = "Destoy")
    "#{show_link(object, params)} #{edit_link(object, params)} #{destroy_link(object, params)}".html_safe
  end

  private

  def controller_name(object)
    object.class.name.pluralize.underscore
  end
end

