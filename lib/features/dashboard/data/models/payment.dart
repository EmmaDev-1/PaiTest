/// Entity representing a single payment in the payment history.
class Payment {
  final String date;
  final String amount;

  Payment({required this.date, required this.amount});

  /// Factory method to create a Payment from JSON.
  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      date: json['date'] as String,
      amount: json['amount'] as String,
    );
  }
}
