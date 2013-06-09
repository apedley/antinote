class Note < ActiveRecord::Base
  before_save :format_body
  def self.preview_text(text)
    self.format_text(text)
  end

  private

  def self.format_text(text)
    markdown = Redcarpet::Markdown.new(HTMLwithPygments, :fenced_code_blocks => true)

    markdown.render(text)
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