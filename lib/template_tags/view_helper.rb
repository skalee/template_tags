module TemplateTags
  module ViewHelper

    def template_tag id, &block
      content_tag :script, type: "text/x-tmpl", id: id, &block
    end

  end
end
