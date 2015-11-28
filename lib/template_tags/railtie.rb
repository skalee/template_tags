module TemplateTags

  class Railtie < Rails::Railtie
    initializer "template_tags.view_helper" do
      ActionView::Base.send :include, ViewHelper
    end
  end

end
