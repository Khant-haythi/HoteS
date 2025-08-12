import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  List<Map<String, String>> goldItems = [];
  File? customerPhoto, customerIdProof;

  final picker = ImagePicker();

  Future<void> pickImage(ImageSource source, Function(File) setImage) async {
    final picked = await picker.pickImage(source: source);
    if (picked != null) {
      setState(() {
        setImage(File(picked.path));
      });
    }
  }

  void addGoldItem() {
    setState(() {
      goldItems.add({
        'desc': '',
        'weight': '',
        'purity': '',
        'loan': '',
        'interest': '',
        'duration': '',
      });
    });
  }

  void generateBill() {
    if (nameController.text.isEmpty || phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter customer name and phone')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Bill generated!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gold Loan Billing"),
        backgroundColor: Colors.amber[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Customer Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () =>
                      pickImage(ImageSource.gallery, (f) => customerPhoto = f),
                  child: const Text('Customer Photo'),
                ),
                if (customerPhoto != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Image.file(customerPhoto!, width: 60),
                  ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () =>
                      pickImage(ImageSource.gallery, (f) => customerIdProof = f),
                  child: const Text('ID Proof'),
                ),
                if (customerIdProof != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Image.file(customerIdProof!, width: 60),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Gold Items",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...goldItems.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, String> item = entry.value;
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      TextField(
                        decoration:
                        const InputDecoration(labelText: 'Description'),
                        onChanged: (val) => item['desc'] = val,
                      ),
                      TextField(
                        decoration:
                        const InputDecoration(labelText: 'Weight (g)'),
                        keyboardType: TextInputType.number,
                        onChanged: (val) => item['weight'] = val,
                      ),
                      TextField(
                        decoration:
                        const InputDecoration(labelText: 'Purity (%)'),
                        keyboardType: TextInputType.number,
                        onChanged: (val) => item['purity'] = val,
                      ),
                      TextField(
                        decoration:
                        const InputDecoration(labelText: 'Loan Amount'),
                        keyboardType: TextInputType.number,
                        onChanged: (val) => item['loan'] = val,
                      ),
                      TextField(
                        decoration:
                        const InputDecoration(labelText: 'Interest (%)'),
                        keyboardType: TextInputType.number,
                        onChanged: (val) => item['interest'] = val,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                            labelText: 'Duration (months)'),
                        keyboardType: TextInputType.number,
                        onChanged: (val) => item['duration'] = val,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              goldItems.removeAt(index);
                            });
                          },
                          child: const Text(
                            'Remove',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: addGoldItem,
              icon: const Icon(Icons.add),
              label: const Text('Add Gold Item'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: generateBill,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 45),
                backgroundColor: Colors.amber[700],
              ),
              child: const Text(
                'Generate Bill',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
