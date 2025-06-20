abstract class ApiKeys {
  static const String chatBaseUrl = 'https://studenthub-chat-app.vercel.app/';
  static const String realTimeChatUrl = 'http://stationone.ddns.net:8080';
  //https://studenthub-chat-app.vercel.app/
  static const String chatApiKey = '678c0c6f-ae90-8006-983b-3eaa993b9762';
  //678c0c6f-ae90-8006-983b-3eaa993b9762
  static const String chatGetMessagesUrl = '/api/messages?';
  static const String chatGetChatsUrl = '/api/chats/';
  static const String chatSendMessageUrl = 'api/messages?';
  static const String chatDeleteMessageUrl =
      '/api/messages/67a90f88084212e98dd87606?';

  static const String chatDeleteChatUrl =
      '/api/chats/67a90f35084212e98dd875fe?';
  static const String chatGetChatId = '/api/chats/?';
  static const String aiRecomendationUrl =
      'http://stationone.ddns.net:8000/recommend';

// // these is just for testing
//   static const String id1 = '3f9d3c82-b38e-4a2e-9f32-fcba6d4f23b9';
//   static const String id2 = 'a4f8f3ce-2e76-4b89-8736-91c2ec54ff5d';
}
