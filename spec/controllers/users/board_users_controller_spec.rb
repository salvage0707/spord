require 'rails_helper'

RSpec.describe Users::BoardUsersController, type: :controller do
  let(:user) { create(:user) }
  # let(:boards) { create_list(:board, 6) }
  let(:board) { create(:board) }
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
        board_id: board_id,
        board_user: {
          comment: "コメント"
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

      it "@recestにBoardUser.newが入っているか" do
        expect(assigns :recest).to be_a_new(BoardUser)
      end
      it "@recestにログインユーザーのidが入っているか" do
        expect(assigns(:recest).user_id).to eq user.id
      end
    end

    context "ログインユーザーが申請していた場合" do
      it "意図したビューにリダイレクトできてるか" do
        pending "治らず保留中"
        login_user user
        create(:board_user)
        get :new, board_id
        expect(response).to redirect_to board_path(board.id)
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
  # describe "GET #create" do

  #   context "ログインユーザーが参加していない場合" do
  #     context "保存に成功した場合" do
  #       it "データベースに保存できたか" do
  #       end
  #       it "意図したビューにリダイレクトできてるか" do
  #       end
  #       it ""
  #     end

  #     context "保存に失敗した場合" do
  #     end
  #   end
  # end



# -----------------------------------------------------------
# newアクション
# -----------------------------------------------------------
  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end


end
