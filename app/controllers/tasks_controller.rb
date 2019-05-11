class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :check_user, only: [:show, :edit, :update, :destroy]
    
    def index
        # paramsはハッシュのようなもの
        # pageという名前のパラメーターが送られてこない場合には、params[:page]はnilになる
        @tasks = Task.all.page(params[:page])
        # current_userは現在ログインしているUserクラスのインスタンスを戻り値として返す
        if logged_in?
            @tasks = Task.where(user_id: current_user.id).page(params[:page])
        end
        # @tasks = Task.where(user: current_user).page(params[:page])
        # @tasks = current_user.tasks.page(params[:page])
    end
    
    def show
        redirect_to root_url if @task.user != current_user
    end

    def new
        @task = Task.new
        @task.user = current_user
        # @task.user_id = current_user.id
        @user = current_user
        # @task = current_user.tasks.build
        # 下記はcurrent_userと同じこと
        # @user = User.find(session[:user_id])
    end

    def create
        @task = Task.new(task_params)
        @task.user = current_user
        # @task = current_user.tasks.build(task_params)
        
        if @task.save
            flash[:success] = 'Taskは正常に投稿されました'
            redirect_to @task
        else
            flash.now[:danger] = 'Taskが投稿されませんでした'
            render :new
        end
    end

    def edit
    end

    def update
        if @task.update(task_params)
            flash[:success] = 'Taskは正常に更新されました'
            redirect_to @task
        else
           flash.now[:danger] = 'Taskは更新されませんでした'
           render :edit
        end
    end

    def destroy
        @task.destroy
        
        flash[:success] = 'Taskは正常に削除されました'
        redirect_to tasks_url
    end
    
    private
    def task_params
        params.require(:task).permit(:content, :status)
    end
    
    def set_task
        @task = Task.find(params[:id])
    end
    def check_user
        if @task.blank? || @task.user != current_user
            redirect_to root_url 
        end
    end
end
