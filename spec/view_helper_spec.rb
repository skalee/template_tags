require "spec_helper"

describe TemplateTags::ViewHelper, :type => :helper do

  describe "#template_tag" do
    let(:described_method){ helper.public_method :template_tag }

    it "is a helper method" do
      expect(described_method).not_to be_nil
    end
  end

end
