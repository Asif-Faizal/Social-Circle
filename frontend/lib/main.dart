import 'package:flutter/material.dart';
import 'package:frontend/core/routing/routing_contants.dart';
import 'package:frontend/core/routing/routing_generator.dart';
import 'package:frontend/core/routing/routing_service.dart';
import 'core/theme/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Circle',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      navigatorKey: NavigationService().navigatorKey,
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings, context),
      initialRoute: RoutingConstants.splashScreen,
    );
  }
}

class ThemeShowcasePage extends StatelessWidget {
  const ThemeShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Showcase'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display Text Styles
            Text('Display Large', style: textTheme.displayLarge),
            const SizedBox(height: 8),
            Text('Display Medium', style: textTheme.displayMedium),
            const SizedBox(height: 8),
            Text('Display Small', style: textTheme.displaySmall),
            const SizedBox(height: 24),
            
            // Title Text Styles
            const Divider(),
            Text('Title Styles', style: textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Title Large', style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Text('Title Medium', style: textTheme.titleMedium),
            const SizedBox(height: 4),
            Text('Title Small', style: textTheme.titleSmall),
            const SizedBox(height: 24),
            
            // Body Text Styles
            const Divider(),
            Text('Body Styles', style: textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Body Large - This is a sample text showing the body large style for longer paragraphs of text in the application.', 
                style: textTheme.bodyLarge),
            const SizedBox(height: 4),
            Text('Body Medium - This is a sample text showing the body medium style for content in the application.', 
                style: textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text('Body Small - This is a sample text showing the body small style for secondary content.', 
                style: textTheme.bodySmall),
            const SizedBox(height: 24),
            
            // Label Text Styles
            const Divider(),
            Text('Label Styles', style: textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Label Large', style: textTheme.labelLarge),
            const SizedBox(height: 4),
            Text('Label Medium', style: textTheme.labelMedium),
            const SizedBox(height: 4),
            Text('Label Small', style: textTheme.labelSmall),
            const SizedBox(height: 24),
            
            // Buttons
            const Divider(),
            Text('Buttons', style: textTheme.titleLarge),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Elevated Button'),
                ),
                ElevatedButton(
                  onPressed: null,
                  child: const Text('Disabled'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.bookmark),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // ListTile examples
            const Divider(),
            Text('ListTile Components', style: textTheme.titleLarge),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: AppThemes.primaryColor,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text('John Doe', style: textTheme.titleMedium),
                    subtitle: Text('Online', style: textTheme.bodySmall),
                    trailing: const Icon(Icons.more_vert),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: AppThemes.primaryLightColor,
                      child: Icon(Icons.person, color: AppThemes.primaryColor),
                    ),
                    title: Text('Jane Smith', style: textTheme.titleMedium),
                    subtitle: Text('Away', style: textTheme.bodySmall),
                    trailing: const Icon(Icons.more_vert),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Input fields
            const Divider(),
            Text('Input Fields', style: textTheme.titleLarge),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
                hintText: 'Enter your username',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                hintText: 'Enter your password',
                errorText: 'Password is required',
              ),
            ),
            const SizedBox(height: 24),
            
            // Cards
            const Divider(),
            Text('Cards', style: textTheme.titleLarge),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Card Title', style: textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(
                      'This is a sample card showing the card styling with some content inside it. Cards can be used to group related content together.',
                      style: textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('CANCEL'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('SUBMIT'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppThemes.primaryColor,
        foregroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: AppThemes.primaryColor,
        unselectedItemColor: AppThemes.textLightColor,
      ),
    );
  }
}