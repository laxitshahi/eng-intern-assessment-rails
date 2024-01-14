require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before do
    @article = Article.create(
      title: 'MyText',
      content: 'MyText',
      author: 'MyString',
      date: Date.today
    )
  end

  describe 'GET #index' do
    it 'should get index' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'should get new' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'should create article' do
      expect {
        post :create, params: { article: { author: @article.author, content: @article.content, date: @article.date, title: @article.title } }
      }.to change(Article, :count).by(1)

      expect(response).to redirect_to(article_url(Article.last))
    end
  end

  describe 'GET #show' do
    it 'should show article' do
      get :show, params: { id: @article }
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'should get edit' do
      get :edit, params: { id: @article }
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    it 'should update article' do
      patch :update, params: { id: @article, article: { author: @article.author, content: @article.content, date: @article.date, title: @article.title } }
      expect(response).to redirect_to(article_url(@article))
    end
  end

  describe 'DELETE #destroy' do
    it 'should destroy article' do
      expect {
        delete :destroy, params: { id: @article }
      }.to change(Article, :count).by(-1)

      expect(response).to redirect_to(articles_url)
    end
  end
end