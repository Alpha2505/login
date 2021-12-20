import 'package:flutter/material.dart';
import 'package:login_ui/common/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class slot extends StatefulWidget {
  slot({Key key, this.title}) : super(key: key);
  @override
  State<slot> createState() => _slotState();
  final String title;
}

class _slotState extends State<slot> {
  int totalAmount = 100;
  Razorpay _razorpay;
  String dropdownvalue = '1PM-2PM';

  var items = [
    '9AM-10AM',
    '10AM-11AM',
    '11AM-12AM',
    '12AM-1AM',
    '1PM-2PM',
    '2PM-3PM',
    '3PM-4PM',
    '5PM-6PM'
  ];

  final myController = TextEditingController();

  String inputId = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_kOmQ6n4iunyQhQ',
      'amount': totalAmount * 100,
      'name': 'CHARGEMe!!',
      'Description': 'Test Payment',
      'prefill': {'contact': '', 'email': ''},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: 'SUCCESS: ' + response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'ERROR: ' + response.code.toString() + '-' + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: 'EXTERNAL WALLET: ' + response.walletName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          brightness: Brightness.dark,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: Text('BOOK YOUR SLOT'),
          toolbarHeight: 75,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Colors.teal.shade400, Colors.grey],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
                  height: 80,
                  width: 200,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter ID',
                    ),
                    controller: myController,
                    onChanged: (text) {
                      inputId = text;
                      print(inputId);
                    },
                  ),
                ),
              ),
              Container(
                child: DropdownButton(
                  value: dropdownvalue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownvalue = newValue.toString();
                    });
                  },
                ),
              ),
              SizedBox(height: 90),
              Container(
                  decoration: ThemeHelper().buttonBoxDecoration(context),
                  child: ElevatedButton(
                      style: ThemeHelper().buttonStyle(),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                // Retrieve the text the that user has entered by using the
                                // TextEditingController.
                                content: Text(
                                    "Station-ID - ${inputId}\nSlot - ${dropdownvalue}"));
                          },
                        );
                      },
                      child: Text("Verify".toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)))),
              SizedBox(height: 90),
              Container(
                decoration: ThemeHelper().buttonBoxDecoration(context),
                child: ElevatedButton(
                  style: ThemeHelper().buttonStyle(),
                  onPressed: () {
                    openCheckout();
                  }, //after login redirect to homepage
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    child: Text('Pay to confirm slot'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              )
            ],
          )),
        ));
  }
}
