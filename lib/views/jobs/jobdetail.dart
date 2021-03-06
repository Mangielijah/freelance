import 'package:badges/badges.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_funday_1/utils/authentication.dart';
import 'package:flutter_funday_1/views/jobs/jobs.dart';
import 'package:flutter_funday_1/widgets/button.dart';
import 'package:flutter_funday_1/widgets/header.dart';
import 'package:csc_picker/csc_picker.dart';

class JobDetial extends StatelessWidget {
  final Map<String, dynamic> data;
  JobDetial({Key key, this.data}) : super(key: key);

  final ValueNotifier<FilePickerResult> filePickerNotifier =
      ValueNotifier(null);
  final ValueNotifier<Map<String, dynamic>> cscNotifier = ValueNotifier({});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<String> skills =
        (data['skills'] as List).map((e) => e as String).toList();
    final List<String> location =
        (data['location'] as List).map((e) => e as String).toList();
    final List<String> language =
        (data['language'] as List).map((e) => e as String).toList();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 100, right: 100),
              child: AppHeader(),
            ),
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.only(
                  left: 100, right: 100, top: 18, bottom: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data['title'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Badge(
                            badgeContent: Text(
                              "APPLICATION OPEN",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            badgeColor: Colors.blue[900],
                            borderRadius: BorderRadius.circular(50),
                            shape: BadgeShape.square,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "SALARY",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                TextSpan(
                                  text: (data['salary_type'] == "fixed")
                                      ? (data['salary'] != null)
                                          ? "${data['salary']} XAF/monthly"
                                          : 'Not Available'
                                      : (data['salary'] != null)
                                          ? "${data['salary']} XAF/hourly"
                                          : 'Not Available',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 100,
                  right: 100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
                      child: Text(
                          "Freelancer  >  Jobs  >  Browse All Jobs  >  ${data['title']}"),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Filter Section
                            Expanded(
                              flex: 3,
                              child: Container(
                                color: Colors.white,
                                padding: const EdgeInsets.only(
                                  left: 64,
                                  right: 64,
                                  top: 30,
                                ),
                                child: ListView(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Location: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Container(
                                          child: Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            runSpacing: 8.0,
                                            spacing: 4.0,
                                            children: location
                                                .map(
                                                  (String skill) => Badge(
                                                    badgeColor:
                                                        Colors.blue[900],
                                                    shape: BadgeShape.square,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    badgeContent: Text(
                                                      skill,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        )
                                        // Text(
                                        //   "Remote",
                                        //   style: TextStyle(
                                        //     fontSize: 16,
                                        //   ),
                                        // )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Language: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Container(
                                          child: Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            runSpacing: 8.0,
                                            spacing: 4.0,
                                            children: language
                                                .map(
                                                  (String skill) => Badge(
                                                    badgeColor:
                                                        Colors.blue[900],
                                                    shape: BadgeShape.square,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    badgeContent: Text(
                                                      skill,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Skill: ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Container(
                                          child: Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            runSpacing: 8.0,
                                            spacing: 4.0,
                                            children: skills
                                                .map(
                                                  (String skill) => Badge(
                                                    badgeColor:
                                                        Colors.blue[900],
                                                    shape: BadgeShape.square,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    badgeContent: Text(
                                                      skill,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      "Description",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      data['description'],
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 17,
                                        letterSpacing: 1.2,
                                        wordSpacing: 1.5,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Text(
                                      "Apply for this job",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Divider(),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    TextField(
                                      controller: nameController,
                                      maxLines: 1,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        hintText: "Full Names",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    TextField(
                                      controller: emailController,
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: "Email address",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    TextField(
                                      controller: phoneController,
                                      maxLines: 1,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        hintText: "Phone number",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable: cscNotifier,
                                      builder: (context, cscMap, _) {
                                        return CSCPicker(
                                          defaultCountry:
                                              DefaultCountry.Cameroon,
                                          onCountryChanged: (value) {
                                            cscNotifier.value = {
                                              "country": value,
                                              "state":
                                                  cscNotifier.value['state'],
                                              "city": cscNotifier.value['city']
                                            };
                                          },
                                          onStateChanged: (value) {
                                            // setState(() {
                                            //   stateValue = value;
                                            // });
                                            cscNotifier.value = {
                                              "country":
                                                  cscNotifier.value['country'],
                                              "state": value,
                                              "city": cscNotifier.value['city']
                                            };
                                          },
                                          onCityChanged: (value) {
                                            // setState(() {
                                            //   cityValue = value;
                                            // });
                                            cscNotifier.value = {
                                              "country":
                                                  cscNotifier.value['country'],
                                              "state":
                                                  cscNotifier.value['state'],
                                              "city": value,
                                            };
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Button(
                                          onTap: () {
                                            getInput();
                                          },
                                          text: 'Click to upload your resume',
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        ValueListenableBuilder<
                                            FilePickerResult>(
                                          valueListenable: filePickerNotifier,
                                          builder:
                                              (context, filePickerResult, _) {
                                            return (filePickerResult == null)
                                                ? Text('')
                                                : Container(
                                                    padding:
                                                        EdgeInsets.all(9.0),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Colors.grey[100]),
                                                    child: Text(
                                                      filePickerResult.names[0],
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                        fontSize: 20.0,
                                                        fontWeight:
                                                            FontWeight.w100,
                                                      ),
                                                    ),
                                                  );
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                    Button(
                                      text: 'Submit',
                                      onTap: () async {
                                        if (nameController.text.isNotEmpty &&
                                            emailController.text.isNotEmpty &&
                                            phoneController.text.isNotEmpty) {
                                          if (cscNotifier.value['country'] !=
                                                  null &&
                                              cscNotifier.value['state'] !=
                                                  null &&
                                              cscNotifier.value['city'] !=
                                                  null) {
                                            if (filePickerNotifier
                                                .value.files.isNotEmpty) {
                                              PlatformFile file =
                                                  filePickerNotifier
                                                      .value.files[0];
                                              Reference ref = storage
                                                  .ref('resume/${file.name}');
                                              try {
                                                UploadTask task =
                                                    ref.putData(file.bytes);
                                                task.whenComplete(
                                                  () async {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                            "Resume Uploaded successfully"),
                                                      ),
                                                    );
                                                    String applicationId =
                                                        firestore
                                                            .collection("jobs")
                                                            .doc()
                                                            .id;
                                                    String downloadURL =
                                                        await ref
                                                            .getDownloadURL();
                                                    await firestore
                                                        .collection("jobs")
                                                        .doc(data['job_id'])
                                                        .collection(
                                                            "applications")
                                                        .doc(applicationId)
                                                        .set({
                                                      "application_id":
                                                          applicationId,
                                                      "name":
                                                          nameController.text,
                                                      "email":
                                                          emailController.text,
                                                      "phone":
                                                          phoneController.text,
                                                      "country": cscNotifier
                                                          .value['country'],
                                                      "state": cscNotifier
                                                          .value['state'],
                                                      "city": cscNotifier
                                                          .value['city'],
                                                      "resume": downloadURL,
                                                    }).then((value) {
                                                      print("User Added");
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Jobs()));
                                                    }).catchError((error) => print(
                                                            "Failed to add user: $error"));
                                                  },
                                                );
                                              } on FirebaseException catch (e) {
                                                // e.g, e.code == 'canceled'
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Failed to upload resume"),
                                                ));
                                              }
                                            }
                                          }
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Image.asset('office.jpg'),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: 5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Market Research (Agencies)',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey[600]),
                                            ),
                                            margin: EdgeInsets.all(3.0),
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Market Research (Agencies)',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15.0),
                                                    ),
                                                    Text('20 000 XAF/month'),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Button(
                                                        text: 'View Job',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getInput() async {
    filePickerNotifier.value = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['pdf', 'txt', 'doc', 'docx'],
    );
    // return result;
  }
}
