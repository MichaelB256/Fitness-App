import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class settingsPage extends StatelessWidget {
  const settingsPage({super.key});
  Widget buttonDefault(String text, var width, var height) {
    return Flexible(
      flex: 20,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            minimumSize: Size(width * 0.8, height * 0.1)),
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AspectRatio(
        aspectRatio: width / height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 5,
                child: IconButton(
                  iconSize: 20,
                  splashRadius: 10,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {},
                ),
              ),
              Flexible(
                flex: 30,
                child: Column(children: [
                  Expanded(
                    flex: 9,
                    child: Material(
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        onTap: () {},
                        child: Ink.image(
                          image: const AssetImage('assets/App_Icon_Powr.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Text("Account Name"),
                  ),
                ]),
              ),
              Flexible(
                  flex: 20,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const accountSettings()));
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        minimumSize: Size(width * 0.8, height * 0.1)),
                    child: const Text("Account Settings"),
                  )),
              Flexible(
                  flex: 20,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        minimumSize: Size(width * 0.8, height * 0.1)),
                    child: const Text("App Settings"),
                  )),
              Flexible(
                  flex: 20,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        minimumSize: Size(width * 0.8, height * 0.1)),
                    child: const Text("Accessibility Settings"),
                  )),
              Flexible(
                  flex: 20,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        minimumSize: Size(width * 0.8, height * 0.1)),
                    child: const Text("Sign Out"),
                  )),
            ]),
      ),
    );
  }
}

class accountSettings extends StatefulWidget {
  const accountSettings({super.key});
  @override
  accountSettingsState createState() => accountSettingsState();
}

class accountSettingsState extends State<accountSettings> {
  final fieldText = TextEditingController();

  Future changePassword() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: const Text('Change Password'),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  controller: fieldText,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Current Password',
                  ),
                  onFieldSubmitted: (value) {
                    fieldText.clear();
                  },
                ),
                TextFormField(
                  controller: fieldText,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'New Password',
                  ),
                  onFieldSubmitted: (value) {
                    fieldText.clear();
                  },
                ),
                TextFormField(
                  controller: fieldText,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm New Password',
                  ),
                  onFieldSubmitted: (value) {
                    fieldText.clear();
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: const Text('SUBMIT'),
                onPressed: () {},
              ),
            ]),
      );

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AspectRatio(
        aspectRatio: width / height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 5,
                child: IconButton(
                  iconSize: 20,
                  splashRadius: 10,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Flexible(
                flex: 30,
                child: Column(children: [
                  Expanded(
                    flex: 9,
                    child: Material(
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        onTap: () {},
                        child: Ink.image(
                          image: const AssetImage('assets/App_Icon_Powr.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Text("Edit Profile Picture"),
                  ),
                  Flexible(
                    flex: 6,
                    child: SizedBox(
                      width: width * 0.8,
                      height: height * 0.1,
                      child: TextFormField(
                        controller: fieldText,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                        onFieldSubmitted: (value) {
                          fieldText.clear();
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: SizedBox(
                      width: width * 0.8,
                      height: height * 0.1,
                      child: TextFormField(
                        controller: fieldText,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email Address',
                        ),
                        onFieldSubmitted: (value) {
                          fieldText.clear();
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: width * 0.5,
                      height: height * 0.5,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 10),
                        ),
                        onPressed: () {
                          changePassword();
                        },
                        child: const Text('Change Password'),
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
      ),
    );
  }
}
