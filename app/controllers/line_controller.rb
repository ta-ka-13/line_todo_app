require 'line/bot'
  class LineController < ApplicationController
    protect_from_forgery :except => [:bot]

    def bot
      body = request.body.read
      signature = request.env['HTTP_X_LINE_SIGNATURE']
      unledd cline.validate_signature(body,signature)
      head :bad_request
    end

    events = client.parse_events_from(body)
    events.each{|event| case event when Line::Bot::Event::Message case event.type when Line::Bot::Event::MessageType::Text

    task = event[‘message’][‘text’]
    begin
      Task.create!(task: task)

      message = {type:'text',text:"タスク『#{task}』を登録しました！"}
      client.reply_message(event['replyToken'],replyToken'],message)
    rescue
      message = {type: 'text,text:"タスク『#{task}』の登録に失敗しました。"} 
      client.reply_message(event['replyToken'],message)
    end
  end
end

    head :ok
  end


private

  def client
    @client || = Line::Bot::Client.new 
    { |config| config.channel_secret = ENV["LINE_CHANNEL_SECRET"] config.channel_token = ENV["LINE_CHANNEL_TOKEN"]}
    end
  end