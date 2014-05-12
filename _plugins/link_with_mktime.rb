module Jekyll
    class LinkWithMtimeTag < Liquid::Tag

        def initialize(tag_name, text, tokens)
            super
            @text = text.strip
        end

        def render(context)
            filename = File.join(File.dirname(__FILE__), '..', @text)
            "#{@text}?#{File.mtime(filename).to_i}"
        end
    end
end

Liquid::Template.register_tag('link_with_mtime', Jekyll::LinkWithMtimeTag)
