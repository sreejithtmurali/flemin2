import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:MyPortfolio(),
    );
  }
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.teal,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white70),
        ),
      ),
      home: PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(),
            AboutSection(),
            ProjectsSection(),
            SkillsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      height: MediaQuery.of(context).size.height * 0.9,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal, Colors.blueGrey],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
                "https://media.licdn.com/dms/image/v2/D5603AQFhZHbGTjpjxQ/profile-displayphoto-shrink_400_400/B56ZSDRi5IHwAk-/0/1737369203104?e=1744243200&v=beta&t=mqY12IQZVdOdJOf9YsavwJiNXFf5JRrR5LGiYa59h4A" ),
          ),
          SizedBox(height: 20),
          Text("Sreejith Murali", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          Text("Flutter Developer & Trainer", style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => launchUrl(Uri.parse("https://www.linkedin.com/in/sreejith-murali-70b42b211")),
            child: Text("View LinkedIn"),
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("About Me", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)),
          SizedBox(height: 10),
          Text("Mobile app developer with 5 years of experience in Native Android and Flutter app development and training. Passionate about learning new technologies and improving app performance."),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Projects", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)),
          SizedBox(height: 10),
          projectTile("avocartE", "E-commerce grocery shopping app"),
          projectTile("My Daily Shopping", "E-commerce grocery shopping app"),
          projectTile("Meeberri", "E-commerce electronics shopping app"),
          projectTile("Octice", "Debt recovery and auction listing app"),
        ],
      ),
    );
  }

  Widget projectTile(String title, String description) {
    return Card(
      color: Colors.blueGrey[900],
      elevation: 6,
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal)),
        subtitle: Text(description),
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Skills", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)),
          SizedBox(height: 10),
          Text("Flutter, Dart, Firebase, SQL, Hive, Provider, GetX, Bloc, Riverpod, Java, Kotlin"),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Contact", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal)),
          SizedBox(height: 10),
          contactTile("Email", "sreejithtmurali@gmail.com"),
          contactTile("Phone", "8111821149"),
          GestureDetector(
            onTap: () => launchUrl(Uri.parse("https://www.linkedin.com/in/sreejith-murali-70b42b211")),
            child: Text("LinkedIn", style: TextStyle(fontSize: 18, color: Colors.blue, decoration: TextDecoration.underline)),
          ),
        ],
      ),
    );
  }

  Widget contactTile(String title, String detail) {
    return Card(
      color: Colors.blueGrey[900],
      elevation: 6,
      child: ListTile(
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal)),
        subtitle: Text(detail),
      ),
    );
  }
}
