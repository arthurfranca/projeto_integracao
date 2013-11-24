module ApplicationHelper
  def form_defaults
    { wrapper_html: { class: "form-group" }, input_html: { class: "form-control" } }
  end
end
