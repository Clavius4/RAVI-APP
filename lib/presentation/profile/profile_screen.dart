import 'package:flutter/material.dart';
import 'package:tax_advisory_app/core/app_export.dart';
import 'package:tax_advisory_app/models/auth_response.dart';

import '../../sessions/session_manager.dart'; // Ensure you have all necessary exports

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String firstname = "";
  String phone = "";
  String lastName = "";
  String organisationName = "";
  String organisationType = "";
  String district = "";
  String region = "";

  @override
  void initState() {
    getProfile();
    super.initState();
  }

  getProfile() async {
   var first= await SessionManager.getFirstname();
  var  phone1 = await SessionManager.getPhone();
   var last = await SessionManager.getLastName();
   var orgName = await SessionManager.getOrganisationName();
   var orgType = await SessionManager.getOrganisationType();
   var reg = await SessionManager.getRegion();
   var dist = await SessionManager.getDistrict();

   setState(() {
     firstname=first;
     phone = phone1;
     lastName = last;
     organisationName = orgName;
     organisationType = orgType;
     region = reg;
     district = dist;
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              _buildTaxAdvisorySystemStack(context), // Custom header
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blueGrey[200],
                      child: const Text(
                        "P",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListTile(
                      leading: Icon(Icons.person,
                          color: Theme.of(context).colorScheme.primary),
                      title: const Text("Full Name"),
                      subtitle: Text("${firstname} ${lastName}"),
                    ),
                    ListTile(
                      leading: Icon(Icons.email,
                          color: Theme.of(context).colorScheme.primary),
                      title: const Text("Email"),
                      subtitle: const Text("john.doe@example.com"),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone,
                          color: Theme.of(context).colorScheme.primary),
                      title: const Text("Phone Number"),
                      subtitle: Text(phone),
                    ),
                    ListTile(
                      leading: Icon(Icons.local_activity,
                          color: Theme.of(context).colorScheme.primary),
                      title: const Text("Organization Type"),
                      subtitle: Text(organisationType),
                    ),
                    ListTile(
                      leading: Icon(Icons.local_activity,
                          color: Theme.of(context).colorScheme.primary),
                      title: const Text("Organization Name"),
                      subtitle:  Text("${organisationName}"),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_city,
                          color: Theme.of(context).colorScheme.primary),
                      title: const Text("Region/District"),
                      subtitle: Text("${region}/${district}"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaxAdvisorySystemStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 337.v,
        // Assuming v is a valid dimension extender or method
        width: double.maxFinite,
        decoration: AppDecoration.fillPrimary,
        // Assuming AppDecoration is defined elsewhere
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CustomImageView(
              // Assuming CustomImageView and ImageConstant are defined elsewhere
              imagePath: ImageConstant.imgImage296x371,
              height: 296.v,
              width: 371.h,
              alignment: Alignment.topCenter,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 19.h,
                  bottom: 38.v,
                ),
                child: Text(
                  "Profile",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
