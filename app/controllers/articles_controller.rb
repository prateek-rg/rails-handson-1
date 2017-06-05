class ArticlesController < ApplicationController

	before_action :fetch_article, only: [:show,:edit,:update,:destroy]
	http_basic_authenticate_with name: 'prateek', password: 'reportgarden', except: [:index, :show]

	def index
		@articles = Article.all
	end

	def show
	end

	def new
		@article = Article.new
	end

	def edit
	end

	def create
		@article = Article.create(article_params);
		if @article.errors.any?
			render 'new'
		else
			redirect_to @article
		end
	end

	def update
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article.destroy
		redirect_to articles_path
	end
	

	private
	def article_params
		params.require(:article).permit(:title, :text)
	end

	def fetch_article
		@article = Article.find(params[:id])
	end

end
