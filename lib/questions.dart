class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      { this.id,
       this.question,
       this.answer,
       this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Who is DON of AI and DS?",
    "options": ['SB', 'JB', 'AP', 'NC'],
    "answer_index": 0,
  },
  {
    "id": 2,
    "question": "Who is pro coder of AI and DS?",
    "options": ['Nayan', 'Faiz', 'Atul', 'Shreya'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Who is illogical prani?",
    "options": ['Atul', 'Pranav', 'Ganesh', 'Sahil'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Who is Hukum Ka Ikka?",
    "options": ['Dhiren', 'Faiz', 'Dhairya', 'None'],
    "answer_index": 0,
  },
];
