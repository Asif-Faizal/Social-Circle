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
  });
  final String name;
  final String email;
  final String imageUrl;
  final Function() onEditProfile;
  final Function() onSettings;
  final Function() onLogout;

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
                          const SizedBox(height: 10),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.edit,size: 15,),
                            label: Text('Edit Profile',style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              foregroundColor: Theme.of(context).primaryColor,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: onEditProfile,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('Settings',style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
            onTap: onSettings,
            trailing: const Icon(Icons.settings,size: 20,),
          ),
          ListTile(
            title: Text('Logout',style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor,fontWeight: FontWeight.bold),),
            onTap: onLogout,
            trailing: const Icon(Icons.logout,size: 20,),
          ),
        ],
      ),
    );
  }
}