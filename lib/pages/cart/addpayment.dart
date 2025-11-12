import 'package:flutter/material.dart';

class Addpayment extends StatefulWidget {
  @override
  _AddpaymentState createState() => _AddpaymentState();
}

class _AddpaymentState extends State<Addpayment> {
  String selectedAddress = "office";
  String selectedPayment = "master";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==== Address Selection ====
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Delivery Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: const Text("Add New")),
                ],
              ),
              const SizedBox(height: 10),

              // Home Address
              RadioListTile(
                value: "home",
                groupValue: selectedAddress,
                onChanged: (value) {
                  setState(() {
                    selectedAddress = value.toString();
                  });
                },
                title: const Text("Home Address"),
                subtitle: const Text(
                  "(309) 071-9396-939\n1749 Custom Road, Chhatak",
                ),
                activeColor: Colors.green,
              ),

              // Office Address
              RadioListTile(
                value: "office",
                groupValue: selectedAddress,
                onChanged: (value) {
                  setState(() {
                    selectedAddress = value.toString();
                  });
                },
                title: const Text("Office Address"),
                subtitle: const Text(
                  "(309) 071-9396-939\n1749 Custom Road, Chhatak",
                ),
                activeColor: Colors.green,
              ),

              const SizedBox(height: 20),
              const Text(
                "Select Payment System",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // ==== Payment Options ====
              Row(
                children: [
               Expanded(
                  flex: 1,
                  child:    _buildPaymentOption(
                    "master",
                    "Master Card",
                    Icons.credit_card,
                  ))
               ,
               Expanded(
                  flex: 1,
                  child:    _buildPaymentOption(
                    "paypal",
                    "Paypal",
                    Icons.account_balance_wallet,
                  ))
               ,
               Expanded(
                flex: 1,
                child:
                _buildPaymentOption("cod", "Cash On Delivery", Icons.money),
)
                ],
              ),

              const SizedBox(height: 20),

              // ==== Card Info ====
              if (selectedPayment == "master") ...[
                _buildTextField("Card Name"),
                _buildTextField("Card Number"),
                Row(
                  children: [
                    Expanded(child: _buildTextField("Expiration Date")),
                    const SizedBox(width: 10),
                    Expanded(child: _buildTextField("CVV")),
                  ],
                ),
              ],

              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("Confirm Payment"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String value, String title, IconData icon) {
    bool isSelected = selectedPayment == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = value;
        });
      },
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Colors.green.shade50 : Colors.white,
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.green : Colors.grey),
            const SizedBox(height: 5),
            Text(title, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
