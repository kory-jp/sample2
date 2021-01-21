require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  describe 'GET #new' do
    before { get :new}

    it 'レスポンスコードが200であること' do
      expect(response).to have_http_status(:ok)
    end

    it 'newテンプレートをレンダリングすること' do
      expect(response).to render_template :new
    end

    it '新しいboardオブジェクトがビューに渡されること' do
      expect(assigns(:board)).to be_a_new Board
    end
  end

  describe 'POST #create' do
    context '正しい掲示板情報が渡って来た場合'
    let(:params) do
      {board: {
        name: 'name',
        title: 'title',
        body: 'body',
        tag_ids: 'tag_id'
      }}
    end

    it '掲示板が一個増えること' do
      expect { post :create, params: params}.to change(Board, :count)
    end

    it '新規作成掲示板へリダイレクトされること' do
      expect(post :create, params: params).to redirect_to(board)
    end
  end
end