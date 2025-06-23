import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(FinalApp());
}

class JobPositionSelectionScreen extends StatelessWidget {
  const JobPositionSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Job Position Selection"),
      ),
      body: Center(
        child: Text(
          "Job Position Selection Screen",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class FinalApp extends StatelessWidget {
  const FinalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/language': (context) => LanguageSelectionScreen(),
        '/signin': (context) => SignInScreen(),
        '/register': (context) => RegisterApp(),
        "/home": (context) => HomeScreen(),

        '/complaints': (context) => ComplaintsPage(),
        // ✅ لازم تكون موجودة
        '/jobPositionSelectionScreen': (context) =>
            JobPositionSelectionScreen(),
        '/ReportFormScreen': (context) => ReportFormScreen(),

        // Add this line to register the route
        '/JobDetailsScreen': (context) => JobDetailsScreen(),

        // Add this line to register the route
        '/profileScreen': (context) => ProfileScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/language');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          "JobLand",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Choose Language",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLanguageButton(
                  context, "assets/American photo.png", "English"),
              SizedBox(width: 20),
              _buildLanguageButton(context, "assets/egypt photo.png", "Arabic"),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_selectedLanguage.isNotEmpty) {
                Navigator.pushNamed(context, '/signin');
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3064FF),
              fixedSize: Size(350, 47),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text("Next",
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          SizedBox(height: 20),
          Text(
            "You can change the language at any time.",
            style: TextStyle(fontSize: 14, color: Color(0xff484848)),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageButton(
      BuildContext context, String flagPath, String language) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
      },
      child: Column(
        children: [
          Image.asset(flagPath, width: 50, height: 50),
          SizedBox(height: 5),
          Text(language, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Let's Sign in. Apply to jobs!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            _buildTextField(
              label: "Email",
              icon: Icons.email,
              obscureText: false,
            ),
            SizedBox(height: 20),
            _buildTextField(
              label: "Password",
              icon: Icons.lock,
              obscureText: _obscureText,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                Text("Remember me", style: TextStyle(color: Colors.black)),
                Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text("Forgot password?",
                        style: TextStyle(color: Color(0xff054CFF)))),
              ],
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF3064FF),
                fixedSize: Size(350, 47),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text("Sign in",
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Divider(thickness: 1, color: Color(0xff8B9598)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Or continue With",
                      style: TextStyle(color: Color(0xff8B9598))),
                ),
                Expanded(
                    child: Divider(thickness: 1, color: Color(0xff8B9598))),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/apple.png', width: 50, height: 50),
                SizedBox(width: 10),
                Image.asset('assets/google.png', width: 50, height: 50),
                SizedBox(width: 10),
                Image.asset('assets/facebook.png', width: 50, height: 50),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? ",
                    style: TextStyle(color: Color(0xff687579))),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    "NEW ACCOUNT",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required bool obscureText,
    Widget? suffixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16)),
        SizedBox(height: 5),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}

//

class RegisterApp extends StatelessWidget {
  const RegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const RegisterScreen(),
    );
  }
}

// استيراد الشاشة الثانية

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

///
///
///
class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                "Create An Account",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Let’s Start\nTogether",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Search or hire in the fastest and easiest way",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  labelText: "Phone Number*",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_city),
                  labelText: "Country*",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Password*",
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "Confirm Password*",
                  suffixIcon: Icon(Icons.visibility),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  labelText: "Birth of date",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                hint: const Text("Gender"),
                items: ["Male", "Female"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {},
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(value: false, onChanged: (_) {}),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        text:
                            "By clicking on create an account, you agree to the ",
                        children: [
                          TextSpan(
                            text: "TERMS OF USE ",
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(
                            text: "and ",
                          ),
                          TextSpan(
                            text: "PRIVACY POLICY",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                      maxLines: 2,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JobPositionScreen()),
                    );
                  },
                  child: const Text("CREATE AN ACCOUNT"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// سكريم الوجهة لما يضغط على الزر

class JobPositionScreen extends StatelessWidget {
  final List<String> suggestions = [
    "Academic Administrator",
    "Backend Developer",
    "Backend Engineer",
    "Backend Technical lead",
    "Backup Administrator",
    "Campaign Director",
    "Campaign Specialist",
    "Data Analytics Analyst",
  ];

  final List<String> selectedTags = ["UI/UX Designer", "Product Designer"];

  JobPositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("What type of jobs are you looking for?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter job position",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: selectedTags.map((tag) {
                return Chip(
                  label: Text(tag),
                  onDeleted: () {},
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: suggestions.map((job) {
                  return ListTile(
                    title: Text(job),
                    trailing: Icon(Icons.add),
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
                // Navigate to the next screen or do something
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

//

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black12,
        width: 250,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),

      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'J',
                style: TextStyle(
                  color: Colors.blue, // Blue color for "J"
                  fontWeight: FontWeight.w500,
                  fontSize: 25, // Adjust the font size as needed
                ),
              ),
              TextSpan(
                text: 'obland',
                style: TextStyle(
                  color: Colors.black, // Black color for the rest of the text
                  fontWeight: FontWeight.w500,
                  fontSize: 25, // Adjust the font size as needed
                ),
              ),
            ],
          ),
        ),
      ),

      // Add other widgets for the home screen

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Complaints Banner
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.blue.withOpacity(0.5),
                    BlendMode.darken,
                  ),
                  image: AssetImage('assets/workers.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "for complaints",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ComplaintsPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                      ),
                      child: const Text(
                        "Contact us",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            _sectionHeader("Categories"),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  CategoryChip(icon: Icons.business, label: "All Jobs"),
                  SizedBox(width: 10),
                  CategoryChip(icon: Icons.school, label: "Teaching"),
                  SizedBox(width: 10),
                  CategoryChip(
                      icon: Icons.manage_accounts, label: "Management"),
                  SizedBox(width: 10),
                  CategoryChip(icon: Icons.design_services, label: "Design"),
                  SizedBox(width: 10),
                  CategoryChip(icon: Icons.code, label: "Development"),
                ],
              ),
            ),
            const SizedBox(height: 20),

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionHeader("Newly Added Jobs"),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 400,
                    // ارتفاع الكارد
                    // أو الطول اللي يناسب تصميمك
                    // أو الطول اللي يناسب ,
                    width: 400,

                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      children: const [
                        JobCard(
                          imageAsset: 'assets/Screenshot (85).png',
                          title: 'Riyadh, Ishbilia district',
                          name: 'Nader Sulaiman',
                          category: 'Marketing',
                          location: 'Saudi Arabia',
                          privacy: 'Hidden',
                          likes: 232,
                        ),
                        JobCard(
                          imageAsset: 'assets/proxy_image.png',
                          title: 'Marketing employee',
                          name: 'Job Admin',
                          category: 'Sales',
                          location: 'Jordan',
                          privacy: 'Hidden',
                          likes: 1284,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            _sectionHeader("Job Seekers"),
            const SizedBox(height: 10),
            Column(
              children: const [
                JobSeekerCard(
                  imageAsset: 'assets/photo_Ahmed.png',
                  name: 'Ahmed mohamed abdelhady',
                  job: 'Teaching',
                  country: 'Egypt',
                  gender: 'Male',
                  age: 29,
                  experience: 1,
                ),
                JobSeekerCard(
                  imageAsset: 'assets/unnamed.png',
                  name: 'Mohamed naser ali',
                  job: 'Management',
                  country: 'Egypt',
                  gender: 'Male',
                  age: 33,
                  experience: 8,
                ),
                JobSeekerCard(
                  imageAsset: 'assets/unnamed.png',
                  name: 'salma mohamed',
                  job: 'Marketing',
                  country: 'Egypt',
                  gender: 'Female',
                  age: 26,
                  experience: 2,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black87,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.description), label: 'Description'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Create'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

Widget _sectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Show All',
          style: TextStyle(color: Colors.blue),
        ),
      ],
    ),
  );
}

class CategoryChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const CategoryChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}

class JobCard extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String name;
  final String category;
  final String location;
  final String privacy;
  final int likes;

  const JobCard({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.name,
    required this.category,
    required this.location,
    required this.privacy,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // تأكد إن ده ارتفاع كافي لكل المحتوى الداخلي
      width: 400,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Image.asset(
                    imageAsset,
                    fit: BoxFit.cover,
                    // ارتفاع الصورة
                  ),
                ),
                const SizedBox(height: 16),
                _infoRow(Icons.title, title),
                _infoRow(Icons.person, name),
                _infoRow(Icons.category, category),
                _infoRow(Icons.location_on, location),
                _infoRow(Icons.lock, privacy),
                _infoRow(Icons.favorite, 'Likes: $likes'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}

class JobSeekerCard extends StatelessWidget {
  final String imageAsset;
  final String name;
  final String job;
  final String country;
  final String gender;
  final int age;
  final int experience;

  const JobSeekerCard({
    super.key,
    required this.imageAsset,
    required this.name,
    required this.job,
    required this.country,
    required this.gender,
    required this.age,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.asset(imageAsset, fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            _infoRow(Icons.person, name),
            _infoRow(Icons.work, job),
            _infoRow(Icons.location_on, country),
            _infoRow(Icons.person, gender),
            _infoRow(Icons.calendar_today, 'Age: $age'),
            _infoRow(Icons.work, 'Experience: $experience years'),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}

//ComplaintsPage

class ComplaintsPage extends StatelessWidget {
  const ComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Complaints',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose the appropriate section for help',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0D99FF),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportFormScreen()),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Submit a complaint',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0D99FF),
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => JobDetailsScreen()),
                );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hotline',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// reportForm_screen.dart

class ReportFormScreen extends StatelessWidget {
  const ReportFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/workers.png', // Add your logo image to assets
                height: 200,
                width: 1000,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 10),
              Text(
                'Fill in the following information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 20),

              _buildTextField('Full name *'),

              // Phone Number or Email
              _buildTextField('Phone number or email *'),

              // Nature of the Problem
              _buildDropdown(),

              // Employer Details
              _buildTextField('Company or employer name *'),
              _buildTextField('Detailed address of the workplace *'),
              _buildTextField('Employer phone number (if applicable) *'),

              // Supporting Evidence
              _buildUploadSection(),

              _buildTextField('Add a description to the evidence *'),

              SizedBox(height: 20),

              // Send Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Send',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        items: [
          DropdownMenuItem(value: '1', child: Text('Complaint 1')),
          DropdownMenuItem(value: '2', child: Text('Complaint 2')),
        ],
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: 'Select the type of complaint *',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
      ),
    );
  }

  Widget _buildUploadSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upload files or images *',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              _buildUploadButton(Icons.image, 'Import Images'),
              SizedBox(width: 10),
              _buildUploadButton(Icons.attach_file, 'Import Files'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUploadButton(IconData icon, String label) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon),
        label: Text(label, style: TextStyle(fontSize: 12)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[300],
          foregroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

// JobDetailsScreen

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/proxy_image.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      icon: Icon(Icons.favorite_sharp,
                          size: 25, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sales employees are required at Bloom Perfumes Company with salaries up to 8,000 riyals',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),

                    // Tags
                    Wrap(
                      spacing: 8,
                      children: [
                        _buildTag(
                          Icons.visibility_off_outlined,
                          'Hidden',
                        ),
                        _buildTag(Icons.work_outline, 'Sales'),
                        _buildTag(
                          Icons.location_on_outlined,
                          'Jordan',
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Views
                    Row(
                      children: [
                        Icon(Icons.remove_red_eye,
                            size: 18, color: Colors.blue),
                        SizedBox(width: 5),
                        Text(
                          '292',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Job Details
                    Text(
                      'Job Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '- The applicant must be a Saudi national\n'
                      '- Previous experience is required\n'
                      '- Working hours are 10 hours and vacation is two days a week\n'
                      '- Age is over 20 and under 45 years',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Advertiser section

                    ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.blue,
                        child: Text('B',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ),
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Bloom'),
                          SizedBox(
                              width:
                                  10), // Adds space between the text and the icon
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ],
                      ),
                      subtitle: Text('Kuwait'),
                      trailing: Wrap(
                        spacing: 8,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text('Advertiser page',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'WhatsApp',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildTag(IconData icon, String label) {
    return Chip(
      avatar: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}

// profileScreen
class ProfileScreen extends StatelessWidget {
  final Color grayColor = Colors.grey.shade200;

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/photo_Ahmed.png'),
                    backgroundColor: Colors.black12,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Ahmed mohamed abdelhady',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      InfoChip(icon: Icons.work, label: 'Teaching'),
                      InfoChip(icon: Icons.location_on, label: 'Egypt'),
                      InfoChip(icon: Icons.male, label: 'Male'),
                      InfoChip(
                          icon: Icons.calendar_today, label: 'Age: 29 Years'),
                      InfoChip(
                          icon: Icons.star,
                          label: 'Years Of Experience: 1 Years'),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ContactIcon(icon: Icons.phone, color: Colors.blue),
                      SizedBox(width: 20),
                      ContactIcon(icon: Icons.g_mobiledata, color: Colors.red),
                      SizedBox(width: 20),
                      ContactIcon(
                        icon: FontAwesomeIcons.whatsapp,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            ProfileSection(
              title: 'Brief About Me',
              content: 'Math teacher',
            ),
            SizedBox(height: 20),
            ProfileSection(
              title: 'University or College',
              content: 'Cairo University',
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Share The Ad",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Icon(Icons.share),
              ],
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/photo_Ahmed.png'),
                    backgroundColor: Colors.black12,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Ahmed mohamed abdelhady'),
                          SizedBox(width: 10),
                          Icon(
                            Icons.check_circle,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text('Egypt'),
                    ],
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Advertiser page',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Reusable chip widget
class InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const InfoChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.grey.shade200,
      avatar: Icon(icon, size: 18),
      label: Text(label),
    );
  }
}

// Contact icons
class ContactIcon extends StatelessWidget {
  final IconData icon;
  final Color color;

  const ContactIcon({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color.withOpacity(0.2),
      child: Icon(icon, color: color),
    );
  }
}

// Section widget
class ProfileSection extends StatelessWidget {
  final String title;
  final String content;

  const ProfileSection({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text(content, style: TextStyle(fontSize: 15)),
        ],
      ),
    );
  }
}
