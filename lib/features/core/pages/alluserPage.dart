import 'package:chic_choices/features/authentication/models/user_model.dart';
import 'package:chic_choices/reuse/reuse_widgets.dart';
import 'package:chic_choices/states/authentication/signup_state.dart';
import 'package:chic_choices/states/core/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class alluserPage extends StatelessWidget {
  const alluserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _state = Get.put(SignUpState());
    final profilestate = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFA939),
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
        title: const Text('ข้อมูลผู้ใช้งาน',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF6C273),
          child: FutureBuilder(
            future: profilestate.getAllUser(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (c, index) {
                      return Column(
                        children: [
                          ListTile(
                            iconColor: Colors.blue,
                            tileColor: Colors.blue.withOpacity(0.1),
                            leading: const Icon(Icons.person),
                            title:
                                Text("Name: ${snapshot.data![index].fullName}"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(snapshot.data![index].phoneNo),
                                Text(snapshot.data![index].email),
                              ],
                            ),
                          )
                        ],
                      );
                    },
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
