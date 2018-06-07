require 'rails_helper'

RSpec.describe BoardsController, type: :controller do

  login_user

  let(:valid_attributes){
    {title: 'board1'}
  }

  let(:invalid_attributes){
    {title: ''}
  }

  describe "GET #index" do
    it 'returns http success' do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it 'returns a success response' do
      board = Board.create! valid_attributes
      get :show, params: {id: board.id}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it 'returns a success response' do
      board = Board.create! valid_attributes
      get :edit, params: {id: board.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context 'with valid params' do
      it 'creates a new board' do
        expect{post :create, params: {board: valid_attributes}}.to change(Board, :count).by(1)
      end
      it 'redirects to the created board' do
        post :create, params: {board: valid_attributes}
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid params' do
      it 'does not create new board' do
        expect{post :create, params: {board: invalid_attributes}}.to change(Board, :count).by(0)
      end
      it 'returns a success response' do
        post :create, params: {board: invalid_attributes}
        expect(response).to be_successful
      end
      it 'returns a success response(i.e displays the new template)' do
        post :create, params: {board: invalid_attributes}
        expect(response).to be_successful
      end

    end
  end

  describe "POST #create" do
    context 'with valid params' do
      let (:new_attributes){
        {title: "board2"}
      }
      it 'updates the requested board' do
        board = Board.create! valid_attributes
        put :update, params: {id: board.id, board: new_attributes}
        board.reload
        expect(board.title).to eq(new_attributes[:title])
      end

      it 'redirects to the board' do
        board = Board.create! valid_attributes
        put :update, params: {id}
      end
    end
  end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
