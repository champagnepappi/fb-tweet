class ConversationsController < ApplicationController
  def create
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id, params[:recipient_id]]).first
    else
      @conversatiom = Conversation.create(conversation_params)
    end
  end
end
