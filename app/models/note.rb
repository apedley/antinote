class Note < ActiveRecord::Base
  belongs_to :category
  
  before_save :format_body
  validates :title, :body, :category_id, presence: true
  validates :title, length: { in: 2..255 }
  validates :body, length: { minimum: 2 }
  def self.preview_text(text)
    self.format_text(text)
  end

  def get_toc
    @toc_markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML_TOC)
    @toc_markdown.render(body)
  end

  def get_pdf
    
  end
  private

  def self.format_text(text)
    @markdown ||= Redcarpet::Markdown.new(HTMLwithPygments, :fenced_code_blocks => true, :tables => true, :autolink => true, :superscript => true, :strikethrough => true, :highlight => true, :no_intra_emphasis => true, :with_toc_data => true, :safe_links_only => true, :no_styles => true)

    @markdown.render(text)
  end

  def format_body
    self.rendered_body = self.class.format_text(self.body) 
  end
end

class HTMLwithPygments < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, :lexer => language)
  end
end