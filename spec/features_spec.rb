describe "Feature and integration specs:", type: :view do

  let(:template_name){ "tested_template.html.erb" }
  let(:parsed_html){ Nokogiri::HTML rendered }

  example "When I call #template_tag" \
    " with single parameter and a block containing some HTML chunk" \
    " I expect it to render a single <script> element" \
    " with id equal to passed parameter" \
    " enclosing the rendered block content" do

    template =
      <<-HTML
        <%= template_tag "simple-tpl" do %>
          <div id="div-with-link">
            <%= link_to "Example", "http://example.test" %>
          </div>
        <% end %>
      HTML

    link_selector ='div#div-with-link > a[href="http://example.test"]'

    stub_template template_name => template
    render template: template_name

    expect(parsed_html).to have_css "#simple-tpl"
    expect(parsed_html_in_script_element "#simple-tpl").to have_css link_selector
  end

  def parsed_html_in_script_element selector
    element = parsed_html.at_css selector
    element.name == "script" or raise
    Nokogiri::HTML::fragment element.text
  end

  def have_css selector
    satisfy{ |html| html.at_css(selector).present? }
  end

end
