module PagesHelper

  def page_title
    if @page_title.present?
      "#{@page_title} | Convenient Recipes"
    else
      "The Social Network of Recipes | Convenient Recipes"
    end
  end
  
end
