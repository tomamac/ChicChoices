import 'package:chic_choices/Reuse/reuse_widgets.dart';
import 'package:chic_choices/features/authentication/models/user_model.dart';
import 'package:chic_choices/states/authentication/signup_state.dart';
import 'package:chic_choices/states/core/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _state = Get.put(SignUpState());
    final profilestate = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFA939),
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
        title: const Text('แก้ไขข้อมูล',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF6C273),
          child: FutureBuilder(
            future: profilestate.getUserData(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;

                  final id = TextEditingController(text: userData.id);
                  final email = TextEditingController(text: userData.email);
                  final password =
                      TextEditingController(text: userData.password);
                  final fullName =
                      TextEditingController(text: userData.fullName);
                  final birthDate =
                      TextEditingController(text: userData.birthDate);
                  final address = TextEditingController(text: userData.address);
                  final phoneNo = TextEditingController(text: userData.phoneNo);

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      hive(1),
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset('images/userprofile.png'),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt_outlined,
                                    color: Color(0xFF84D2FF),
                                    size: 20,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: LRPadding(context),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: fullName,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person_outline),
                                  hintText: 'ชื่อจริง - นามสกุล',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: email,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email_outlined),
                                  hintText: 'อีเมล',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: phoneNo,
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.phone_android_outlined),
                                  hintText: 'เบอร์โทรศัพท์',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: password,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.lock_outlined),
                                  hintText: 'รหัสผ่าน',
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: birthDate,
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.calendar_month_outlined),
                                  hintText: 'วันเกิด',
                                ),
                                onTap: () => _state.selectDate(context),
                                readOnly: true,
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: address,
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.location_city_outlined),
                                  hintText: 'ที่อยู่',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: LRPadding(context),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(),
                          onPressed: () async {
                            final user = UserModel(
                              id: id.text,
                              email: email.text.trim(),
                              password: password.text.trim(),
                              fullName: fullName.text.trim(),
                              phoneNo: phoneNo.text.trim(),
                              address: address.text.trim(),
                              birthDate: birthDate.text.trim(),
                            );
                            await profilestate.updateRecord(user);
                          },
                          child: const Text('ยืนยันการแก้ไข'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: LRPadding(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text.rich(TextSpan(
                                text: 'joined',
                                style: TextStyle(fontSize: 12),
                                children: [
                                  TextSpan(
                                      text: ' dd/mm/yyyy',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12))
                                ])),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.redAccent.withOpacity(0.3),
                                  elevation: 0,
                                  foregroundColor: Colors.red,
                                  shape: const StadiumBorder(),
                                  side: BorderSide.none),
                              child: const Text('Delete'),
                            ),
                          ],
                        ),
                      ),
                      hive(2),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: Text('มีข้อผิดพลาดเกิดขึ้น'));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
          ),
        ),
      ),
    );
  }
}
