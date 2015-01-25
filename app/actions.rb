# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.order(created_at: :desc)
  erb :'messages/index'
end

get '/messages/new' do
  erb :'messages/new'
end

post '/messages' do
  @message = Message.new(
    content: params[:content],
    author:  params[:author],
    url:     params[:url] 
  )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end

get '/messages/:id' do
  @message = Message.find params[:id]
  @messages = Message.where(author: @message.author)
  erb :'messages/show'
end