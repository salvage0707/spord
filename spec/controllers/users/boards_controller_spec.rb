require 'rails_helper'

RSpec.describe Users::BoardsController, type: :controller do
  let(:user) { create(:user) }
  let(:boards) { create_list(:board, 6) }
  let(:board) { create(:board) }
  let(:areas) { create_list(:area, 47) }
  let(:area) { create(:area) }
  let(:ranks) { create_list(:rank, 4) }
  let(:sport) { create(:sport) }
  let(:purposes) { create_list(:purpose, 4) }
  # create用のparams
  let(:sport_params) do
    {params: {sports_name: "テニス"}}
  end
  let(:board_params) do
      { board: {
        sport_id: sport.id,
        area_id: area.id,
        manager_user_id: user.id,
        }.merge(attributes_for(:board))
      }
  end
  let(:not_board_params) do
      { board: {
        sport_id: sport.id,
        area_id: area.id,
        manager_user_id: user.id,
        }.merge(attributes_for(:board, name: ""))
      }
  end
  # 存在するparams[:id]
  let(:id) do
    {params: {id: board.id}}
  end
  # 存在しないparams[:id]
  let(:other_id) do
    {params: {id: rand(200)}}
  end

# -----------------------------------------------------------
# showアクション
# -----------------------------------------------------------
  describe "GET #show" do

    context '[:id]の募集が存在する場合' do
      before do
        board
        get :show, id
      end
      it "@boardに[:id]の募集が入っているか" do
        expect(assigns(:board)).to eq board
      end
      it "showページが表示されているか" do
        expect(response).to render_template :show
      end
      # ログインユーザーの編集の表示のテスト
    end

    context '[:id]の募集が存在しない場合' do
      it "募集一覧にリダイレクトしているか" do
        get :show, other_id
        expect(response).to redirect_to boards_path
      end
    end
  end

# -----------------------------------------------------------
# indexアクション
# -----------------------------------------------------------
  describe "GET #index" do
    it "@new_boardに新しい募集が４つ入っていること" do
      boards
      get :index
      expect(assigns(:new_boards)).to eq Board.last(4)
    end
  end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end


# -----------------------------------------------------------
# newアクション
# -----------------------------------------------------------
  describe "GET #new" do
    it "@areaにAreaの情報全てが入っている" do
      areas
      get :new
      expect(assigns :areas).to eq Area.all
    end

    it "@boardにnewのBoardオブジェクトが入っているか" do
      get :new
      expect(assigns :board).to be_a_new(Board)
    end

    it "@ranksにRankの情報全て入っている" do
      ranks
      get :new
      expect(assigns :ranks).to eq Rank.all
    end

    it "@purposeにPurposeの情報が全て入っている" do
      purposes
      get :new
      expect(assigns :purposes).to eq Purpose.all
    end
  end

# -----------------------------------------------------------
# createアクション
# -----------------------------------------------------------

  describe "POST #create" do

    context "保存に成功した場合" do
      it "データベースに保存できたか" do
        expect{ post :create , params: board_params }.to change(Board, :count).by(1)
      end

      it "意図したビューにリダイレクトできてるか" do
        post :create, params: board_params
        expect(response).to redirect_to board_path(assigns(:board).id)
      end

    end

    context "保存に失敗した場合" do
      it "データベースに保存が行われなかったか" do
        expect{
          post :create, params: not_board_params
        }.to change(Board, :count).by(0)
      end

      it "該当するビューが描画されているか" do
        post :create, params: not_board_params
        expect(response).to render_template :new
      end
    end
  end

# -----------------------------------------------------------
# editアクション
# -----------------------------------------------------------
  describe "GET #edit" do

    context "指定のidの募集が見つかった場合" do
      it "該当するビューが描画されているか" do
        get :edit, id
        expect(response).to render_template :edit
      end
    end

    context "指定のidの募集が見つからなかった場合" do
      it "意図したビューにリダイレクトできてるか" do
        get :edit, other_id
        expect(response).to redirect_to boards_path
      end
    end
  end



end








