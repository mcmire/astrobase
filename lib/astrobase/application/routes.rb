
require 'astrobase/models/post'
require 'astrobase/models/draft'
require 'astrobase/models/page'

class Astrobase::Application
  get '/' do
    self.posts = _find_posts
    mustache :'posts/index'
  end

  get Astrobase::Models::Post.root_url do
    redirect '/'
  end

  get Astrobase::Models::Post.root_url(':slug') do
    if self.post = _find_post(params[:slug])
      mustache :'posts/show'
    else
      _render_404
    end
  end

  get '/index.atom' do
    content_type 'application/xml'
    self.posts = _find_posts(:limit => 15)
    mustache :'posts/feed', :layout => false
  end

  get Astrobase::Models::Post.root_url('drafts') do
    self.posts = _find_drafts
    mustache :'posts/index'
  end

  get Astrobase::Models::Post.root_url('drafts/:slug') do
    if self.post = _find_draft(params[:slug])
      mustache :'posts/show'
    else
      _render_404
    end
  end

  get '/who' do
    mustache :'main/card', :layout => :'layouts/plain'
  end

  %w(about projects).each do |name|
    get "/#{name}" do
      if self.page = _find_page(name)
        mustache :'pages/show'
      else
        _render_404
      end
    end
  end

  error 404 do
    _render_404
  end

  configure :production do
    error 500 do
      _render_500
    end
  end

  #---

  attr_accessor :posts, :post, :page

  def _render_404
    mustache :'errors/not_found', :layout => :'layouts/application'
  end

  def _render_500
    mustache :'errors/server_error', :layout => :"layouts/application"
  end

  def _find_posts(opts={})
    Astrobase::Models::Post.all(opts)
  end

  def _find_post(slug)
    Astrobase::Models::Post.find(slug)
  end

  def _find_drafts(opts={})
    Astrobase::Models::Draft.all(opts)
  end

  def _find_draft(slug)
    Astrobase::Models::Draft.find(slug)
  end

  def _find_page(slug)
    Astrobase::Models::Page.find(slug)
  end
end

