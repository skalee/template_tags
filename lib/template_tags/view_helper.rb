module TemplateTags
  module ViewHelper

    def template_tag id, options = {}, &block
      script_tag_options = {type: "text/x-tmpl", id: id}

      if options[:partial].present?
        content_tag :script, (render options), script_tag_options
      else
        content_tag :script, script_tag_options, &block
      end
    end

  end
end
