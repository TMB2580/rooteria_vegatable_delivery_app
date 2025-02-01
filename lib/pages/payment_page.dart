import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/pages/delivery_progress_page.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;

  // user want to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      // only show dialog if form is valid
      showDialog(context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Payment"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text("Card Number: $cardNumber"),
              Text("Expire Date: $expiryDate"),
              Text("Card Holder name: $cardHolderName"),
              Text("CVV: $cvvCode"),
            ],
          ),
        ),
        actions: [
          //cancle button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancle"),
          ),

          // yes button
          
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DeliveryProgressPage(),
              ),
            );
          } 
            ,child: const Text("Yes"),
          ),
        ],
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
        title: const Text("Checkout"),
      ),
      body: Column(
        children: [
          //credit card
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),

          //Credit Card Form
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
                isCvvFocused = data.isCvvFocused;
              });
            },
            formKey: formKey,
          ),

          const Spacer(),

        MyButton(
          text: "Pay Now", 
          onTap: userTappedPay,
          ),

        const SizedBox(height: 25),

        ],
      ),
    );
  }
}
