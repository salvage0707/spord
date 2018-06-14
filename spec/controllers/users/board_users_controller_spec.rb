require 'rails_helper'

RSpec.describe Users::BoardUsersController, type: :controller do
  let(:user) { create(:user) }
  # let(:boards) { create_list(:board, 6) }
  let(:board) { create(:board) }
  let(:board_user) { create(:board_user,
                             user_id: user.id,
                             board_id: board.id)}
  # let(:areas) { create_list(:area, 47) }
  # let(:area) { create(:area) }
  # let(:ranks) { create_list(:rank, 4) }
  # let(:sport) { create(:sport) }
  # let(:purposes) { cFeate_list(:purpose, 4) }
  # 存在するboardのparams[:id]
  let(:board_id) do
    {params: {board_id: board.id}}
  end
  # 存在しないboardのparams[:id]
  let(:not_board_id) do
    {params: {board_id: rand(100..300)}}
  end
  # 正しいパラメータ
  let(:params) do
    {params: {
        board_id: board.id,
        board_user: {
          comment: "コメント"
        }
      }
    }
  end
  # 正しくないパラメータ
  let(:not_params) do
    {params: {
        board_id: board.id,
        board_user: {
          comment: ""
        }
      }
    }
  end


# -----------------------------------------------------------
# newアクション
# -----------------------------------------------------------
  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

# -----------------------------------------------------------
# newアクション
# -----------------------------------------------------------
  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

# -----------------------------------------------------------
# newアクション
# -----------------------------------------------------------
  describe "GET #new" do

    context "募集が存在して、ログインユーザーが参加していない場合" do
      before do
        login_user user
        get :new, board_id
      end
      it "意図したビューにリダイレクトできてるか" do
        expect(response).to render_template :new
      end

      it "@requestにBoardUser.newが入っているか" do
        expect(assigns :request).to be_a_new(BoardUser)
      end
      it "@requestにログインユーザーのidが入っているか" do
        expect(assigns(:request).user_id).to eq user.id
      end
    end

    context "ログインユーザーが申請していた場合" do
      it "意図したビューにリダイレクトできてるか" do
        login_user user
        board_user
        get :new, board_id
        expect(response).to redirect_to edit_board_board_users_path(board.id)
      end
    end

    context "募集が存在しない場合" do
      it "意図したビューにリダイレクトできてるか" do
        get :new, not_board_id
        expect(response).to redirect_to boards_path
      end
    end
  end

# -----------------------------------------------------------
# createアクション
# -----------------------------------------------------------
  describe "GET #create" do
    before do
      login_user user
      board
    end

    context "保存に成功した場合" do
      it "データベースに保存できたか" do
        expect{ post :create, params }.to change(BoardUser, :count).by(1)
      end
      it "意図したビューにリダイレクトできてるか" do
        post :create, params
        expect(response).to redirect_to board_path(board.id)
      end
    end

    context "保存に失敗した場合" do
      it "データベースに保存されていないか" do
        expect{ post :create, not_params }.to change(BoardUser, :count).by(0)
      end
      it "該当するビューが描画されているか" do
        post :create, not_params
        expect(response).to render_template :new
      end
    end
  end



# -----------------------------------------------------------
# editアクション
# -----------------------------------------------------------
  describe "GET #edit" do
    context "リクエストが通っていない場合" do
      before do
        login_user user
        board_user
        get :edit, board_id
      end
      it "該当のビューが描画されているか" do
        expect(response).to render_template :edit
      end
      it "@requestに指定の値が入っているか" do
        expect(assigns :request).to eq BoardUser.find_by(user_id: user.id,
                                                         board_id: board.id)
      end
    end

    context "リクエストが通っている場合" do
      before do
        login_user user
        board_user.approval = true
        board_user.save
        get :edit, board_id
      end
      it "意図したビューにリダイレクトできてるか" do
        expect(response).to redirect_to board_path(board.id)
      end
    end
  end

# -----------------------------------------------------------
# updateアクション
# -----------------------------------------------------------
  describe "PATCH #update" do
    context "保存に成功した場合" do
      it "指定のモデルが変数に入っているか" do
      end
      it "変更てんが変わっているか" do
      end
      it "意図したビューにリダイレクトできてるか" do
      end
    end

    context "保存に失敗した場合" do
      it "変更されていないか" do
      end
      it "該当のビューが描画されているか" do
      end
    end
  end


end
