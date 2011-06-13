module ApplicationHelper
  # in ApplicationHelper
  def show_link(object, content = "Show")
    link_to(content, object) if can?(:read, object)
  end

  def edit_link(object, content = "Edit")
    link_to(content, [:edit, object]) if can?(:update, object)
  end

  def destroy_link(object, content = "Destroy")
    link_to(content, object, :method => :delete, :confirm => "Are you sure?") if can?(:destroy, object)
  end

  def create_link(object, content = "New")
    if can?(:create, object)
      object_class = (object.kind_of?(Class) ? object : object.class)
      link_to(content, [:new, object_class.name.underscore.to_sym])
    end
  end
  def show_edit_destroy_links(object, show_content = "Show", edit_content = "Edit", destroy_content = "Destoy")
    "#{show_link(object)} | #{edit_link(object)} | #{destroy_link(object)}".html_safe
  end
end

