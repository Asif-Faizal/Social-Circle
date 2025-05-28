import 'package:flutter/material.dart';
class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.onEditProfile,
    required this.onSettings,
    required this.onLogout,
    required this.onAccount,
  });
  final String name;
  final String email;
  final String imageUrl;
  final Function() onEditProfile;
  final Function() onSettings;
  final Function() onLogout;
  final Function() onAccount;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(2),
          bottomRight: Radius.circular(2),
        ),
      ),
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        radius: 50,
                        backgroundImage: NetworkImage(imageUrl,),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(name, style: Theme.of(context).textTheme.titleLarge),
                          Text(email, style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('Account',style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
            onTap: onAccount,
            leading: const Icon(Icons.account_circle,size: 20,),
            trailing: const Icon(Icons.arrow_forward_ios,size: 20,),
          ),
          ListTile(
            title: Text('Settings',style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
            onTap: onSettings,
            leading: const Icon(Icons.settings,size: 20,),
            trailing: const Icon(Icons.arrow_forward_ios,size: 20,),
          ),
          ListTile(
            title: Text('Logout',style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
            onTap: onLogout,
            leading: const Icon(Icons.logout,size: 20,),
          ),
        ],
      ),
    );
  }
}