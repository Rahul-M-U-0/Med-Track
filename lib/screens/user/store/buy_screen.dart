// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meds/sevices/buy_service.dart';

class MedicineBuyScreen extends StatefulWidget {
  const MedicineBuyScreen({
    super.key,
    required this.data,
    required this.storeId,
    required this.productId,
  });

  final Map<String, dynamic> data;
  final String storeId;
  final String productId;

  @override
  State<MedicineBuyScreen> createState() => _MedicineBuyScreenState();
}

class _MedicineBuyScreenState extends State<MedicineBuyScreen> {
  int number = 0;
  final MedicineBuyService _buyService = MedicineBuyService();

  String categoryImagePath(String catgoryStr) {
    switch (catgoryStr) {
      case 'Capsule':
        return 'assets/icons/pills.gif';
      case 'Tablet':
        return 'assets/icons/tablet.gif';
      case 'Liquid':
        return 'assets/icons/liquid.gif';
      case 'Topical':
        return 'assets/icons/tube.gif';
      case 'Cream':
        return 'assets/icons/cream.gif';
      case 'Drops':
        return 'assets/icons/drops.gif';
      case 'Foam':
        return 'assets/icons/foam.gif';
      case 'Gel':
        return 'assets/icons/tube.gif';
      case 'Herbal':
        return 'assets/icons/herbal.gif';
      case 'Inhaler':
        return 'assets/icons/inhalator.gif';
      case 'Injection':
        return 'assets/icons/syringe.gif';
      case 'Lotion':
        return 'assets/icons/lotion.gif';
      case 'Nasal Spray':
        return 'assets/icons/nasalspray.gif';
      case 'Ointment':
        return 'assets/icons/tube.gif';
      case 'Patch':
        return 'assets/icons/patch.gif';
      case 'Powder':
        return 'assets/icons/powder.gif';
      case 'Spray':
        return 'assets/icons/spray.gif';
      case 'Suppository':
        return 'assets/icons/suppository.gif';
      default:
        return 'assets/icons/medicine.gif';
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color.fromARGB(255, 7, 83, 96),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color.fromRGBO(7, 82, 96, 1),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      categoryImagePath(widget.data['category']),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.data['medname'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.data['description'],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Price :",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Text(
                    '${widget.data['price'].toString()} Rs',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Quantity :",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (number > 0) {
                          number--;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Color.fromRGBO(7, 82, 96, 1),
                      size: 30,
                    ),
                  ),
                  Text(number.toString()),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (number < widget.data['total_med']) {
                          number++;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.add_circle,
                      color: Color.fromRGBO(7, 82, 96, 1),
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              InkWell(
                onTap: () async {
                  if (number > 0) {
                    await _buyService.buyMedicine(
                        widget.storeId, widget.productId);
                    int count = widget.data['total_med'] - number;
                    print(count);
                    await FirebaseFirestore.instance
                        .collection('Users')
                        .doc(widget.storeId)
                        .collection('Medicines')
                        .doc(widget.productId)
                        .update({
                      'total_med': count,
                    });
                    Navigator.pop(context);
                    _showSnackBar("Order received succesfully..");
                  } else {
                    _showSnackBar("Quantity must be greaterthan 0");
                  }
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(7, 82, 96, 1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      "Buy",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
