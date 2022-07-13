import 'package:flutter/material.dart';
import 'package:flutter_bayeue/pages/login/login_page.dart';
import 'package:flutter_bayeue/pages/register/create_pin.dart';
import 'package:flutter_bayeue/viewmodel/auth_provider.dart';
import 'package:provider/provider.dart';

class VerifikasiPage extends StatefulWidget {
  const VerifikasiPage({Key? key}) : super(key: key);

  @override
  State<VerifikasiPage> createState() => _VerifikasiPageState();
}

class _VerifikasiPageState extends State<VerifikasiPage> {
  final fromKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 244, 247),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: fromKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/verify.png',
                        height: 240,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Verifikasi Email',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Silakan cek email Anda, kami mengirim OTP ke alamat Email anda',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _otpController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Masukan OTP';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Masukan Kode OTP',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Tidak dapat Code?'),
                        GestureDetector(
                          onTap: () {
                            // Nanti isi oi
                          },
                          child: const Text(
                            ' Kirim Ulang OTP',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: (() async {
                        if (fromKey.currentState!.validate()) {
                          bool response = await authProvider
                              .validation(_otpController.text);

                          if (response == true) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (ctx) {
                              return const LoginPage();
                            }), (route) => false);
                          } else {
                            showDialog(
                              context: context,
                              builder: (ctx) {
                                return Dialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 15),
                                    padding: const EdgeInsets.all(10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image.asset(
                                          'assets/images/notification.png',
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          'Gagal Verifikasi',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text('OTP Tidak Valid'),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        }
                      }),
                      child: const Text(
                        'Verifikasi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 20,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(360),
                    color: Colors.blue),
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
