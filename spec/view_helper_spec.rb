require "spec_helper"

describe TemplateTags::ViewHelper, :type => :helper do

  describe "#template_tag" do
    let(:described_method){ helper.public_method :template_tag }
    let(:id){ "some-id" }
    let(:some_content){ "<div></div>".html_safe }
    let(:rendered_script_element){ parsed_retval.css("script").first }
    let(:parsed_retval){ Nokogiri::HTML::fragment retval }
    let(:enclosed_html){ rendered_script_element.text }

    shared_examples "default behaiour" do
      it "renders script tag as the only top-level element" do
        expect(parsed_retval.children.count).to eq 1
        expect(parsed_retval.children[0].name).to eq "script"
      end

      it "the rendered script tag has id equal to the only parameter passed" do
        expect(rendered_script_element["id"]).to eq id
      end

      it "renders script tag of 'text/x-tmpl' type as a top-level element" do
        expect(rendered_script_element["type"]).to eq "text/x-tmpl"
      end
    end

    context "called with single parameter and a block" do
      let(:retval){ described_method.call id do some_content end }

      include_examples "default behaiour"

      it "encloses passed block content" do
        expect(enclosed_html).to eq some_content
      end
    end

    context "called with single parameter and :partial option" do
      let(:retval){ described_method.call id, partial: "p", what: "ever" }

      before{ allow(helper).to receive(:render).and_return(some_content) }

      include_examples "default behaiour"

      it "passes all the options to #render helper method" do
        expect(helper).to receive(:render).with(partial: "p", what: "ever")
        retval
      end

      it "encloses the content returned by #render helper method" do
        expect(enclosed_html).to eq some_content
      end
    end
  end

end
