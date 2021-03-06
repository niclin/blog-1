module MarkdownHelper
  class HTMLWithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      sha = Digest::SHA1.hexdigest(code)
      Rails.cache.fetch ["code", language, sha].join('-') do
        Pygments.highlight(code, lexer: language)
      end
    end
  end

  def markdown(text)
    #renderer = Redcarpet::Render::HTML.new(hard_wrap: true,safe_links_only: true, filter_html: false)
    renderer = HTMLWithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      tables: true,
      space_after_headers: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end