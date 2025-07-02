import { ChatController } from '../controllers/chat.controller';

const chatController = new ChatController();

export const chatRoutes = {
  getChatHistory: chatController.getChatHistory.bind(chatController),
  converse: chatController.converse.bind(chatController),
}; 