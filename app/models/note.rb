class Note < ActiveRecord::Base
  belongs_to :category
  
  before_save :format_body
  validates :title, :body, :category_id, presence: true
  validates :title, length: { in: 2..255 }
  validates :body, length: { minimum: 2 }
  def self.preview_text(text)
    self.format_text(text)
  end

  private

  def self.format_text(text)
    @markdown ||= Redcarpet::Markdown.new(HTMLwithPygments, :fenced_code_blocks => true)

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