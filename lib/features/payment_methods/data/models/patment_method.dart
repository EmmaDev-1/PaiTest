class PaymentMethod {
  final String id;
  final String cardHolderName;
  final String cardNumber;
  final String expirationDate;
  final String cvv;
  final String cardType; // e.g., Debit or Credit
  final String paymentNetwork; // e.g., Visa, Mastercard
  final String bankName;
  final String bankImage;
  final String cardBankTypeImage;
  final bool isPrimary;

  PaymentMethod({
    required this.id,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expirationDate,
    required this.cvv,
    required this.cardType,
    required this.paymentNetwork,
    required this.bankName,
    required this.bankImage,
    required this.cardBankTypeImage,
    required this.isPrimary,
  });

  /// Factory method to create a PaymentMethod from JSON.
  factory PaymentMethod.fromJson(Map<String, dynamic> json) {
    return PaymentMethod(
      id: json['id'] as String,
      cardHolderName: json['cardHolderName'] as String,
      cardNumber: json['cardNumber'] as String,
      expirationDate: json['expirationDate'] as String,
      cvv: json['cvv'] as String,
      cardType: json['cardType'] as String,
      paymentNetwork: json['paymentNetwork'] as String,
      bankName: json['bankName'] as String,
      bankImage: json['bankImage'] as String,
      cardBankTypeImage: json['cardBankTypeImage'] as String,
      isPrimary: json['isPrimary'] as bool,
    );
  }
}
