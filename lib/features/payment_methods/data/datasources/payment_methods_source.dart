import 'dart:async';
import 'dart:convert';

/// Simulates an API call to fetch payment methods data.
class PaymentMethodsRemoteDataSource {
  Future<List<Map<String, dynamic>>> fetchPaymentMethodsData() async {
    // Simulate a network delay
    await Future.delayed(const Duration(seconds: 1));

    // Simulated JSON response for payment methods
    const jsonString = '''
    [
      {
        "id": "1",
        "cardHolderName": "Emmanuel Aguilar",
        "cardNumber": "**** **** **** 1234",
        "expirationDate": "12/25",
        "cvv": "123",
        "cardType": "Crédito",
        "paymentNetwork": "Visa",
        "bankName": "BBVA Bancomer",
        "bankImage": "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/BBVA_2019.svg/1280px-BBVA_2019.svg.png",
        "cardBankTypeImage": "https://bucket.utua.com.br/img/2022/06/128144a5-visa-clasicapngimg-9601559858836594.png",
        "isPrimary": false
      },
      {
        "id": "2",
        "cardHolderName": "Emmanuel Aguilar",
        "cardNumber": "**** **** **** 5678",
        "expirationDate": "11/24",
        "cvv": "123",
        "cardType": "Débito",
        "paymentNetwork": "Mastercard",
        "bankName": "Nu Bank",
        "bankImage": "https://companieslogo.com/img/orig/NU.D-310a665d.png?t=1720244493",
        "cardBankTypeImage": "https://lastarjetasdecredito.com.mx/wp-content/uploads/Tarjeta-de-credito-Nu.png",
        "isPrimary": false
      },
      {
        "id": "3",
        "cardHolderName": "Emmanuel Aguilar",
        "cardNumber": "**** **** **** 2365",
        "expirationDate": "11/24",
        "cvv": "123",
        "cardType": "Crédito",
        "paymentNetwork": "Mastercard",
        "bankName": "American Express",
        "bankImage": "https://w7.pngwing.com/pngs/1002/997/png-transparent-amex-payment-method-card-icon-thumbnail.png",
        "cardBankTypeImage": "https://www.americanexpress.com/content/dam/amex/mx/beneficios/Centurion-Lounge-Reopening/chg_centurion_mx_chip_480x304.png",
        "isPrimary": true
      }
    ]
    ''';

    // Parse and return the data as a list of maps
    List<dynamic> jsonList = json.decode(jsonString) as List<dynamic>;
    return jsonList.cast<Map<String, dynamic>>();
  }
}
