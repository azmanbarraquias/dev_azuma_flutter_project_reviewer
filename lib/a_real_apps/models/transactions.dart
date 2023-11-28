class Transaction {
  final String title;
  static int _id = 0;
  final double amount;
  final DateTime dateTime;
  late int userID = 0;

  Transaction(
      {required this.title, required this.amount, required this.dateTime}) {
    userID = _id++;
  }
}
