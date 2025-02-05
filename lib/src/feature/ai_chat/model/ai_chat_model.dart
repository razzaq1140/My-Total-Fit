class AiChatModel {
  final String id;
  final String message;
  final String type;
  final DateTime time;

  AiChatModel({
    required this.id,
    required this.type,
    required this.message,
    required this.time,
  });
}

List<AiChatModel> aiChatList = [
  AiChatModel(
    id: '1',
    type: 'user',
    message: "Hello chatGPT,how are you today?",
    time: DateTime.now(),
  ),
  AiChatModel(
    id: '2',
    type: 'ai',
    message: "Hello,i'm fine,how can i help you?",
    time: DateTime.now(),
  ),
  AiChatModel(
    id: '3',
    type: 'user',
    message: "What are effective cardio exercises?",
    time: DateTime.now(),
  ),
  AiChatModel(
    id: '4',
    type: 'ai',
    message:
        "Running, cycling, and swimming are excellent cardiovascular exercises that help improve heart health and endurance. They can be easily adjusted to fit different fitness levels and preferences. Regularly incorporating these activities into your routine can boost overall fitness and promote weight management.",
    time: DateTime.now(),
  ),
];
