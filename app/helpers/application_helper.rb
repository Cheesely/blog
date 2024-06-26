module ApplicationHelper
  def nav_link(text, path)
    class_name = current_page?(path) ? "bg-gray-900 text-white rounded-md px-3 py-2 text-sm font-medium" : "text-gray-300 hover:bg-gray-700 hover:text-white rounded-md px-3 py-2 text-sm font-medium"
    aria_current = current_page?(path) ? { current: "page" } : {}
    
    link_to text, path, class: class_name, aria: aria_current
  end
 
end
