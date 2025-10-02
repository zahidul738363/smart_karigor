import 'package:flutter/material.dart';
import 'vocational_class9_screen.dart';
import 'vocational_class10_screen.dart';
import 'vocational_class11_screen.dart';
import 'vocational_class12_screen.dart';
import 'subject_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  bool _isDarkMode = false;

  final List<Widget> _screens = [
    const HomeContentScreen(),
    const MyNoteScreen(),
    const MyCourseScreen(),
    const ProfileScreen(),
  ];

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: const Text(
            'Smart Karigor',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: _toggleTheme,
            ),
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'My-Note',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'My Course',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Study Section with GridView
          _buildStudySection(context, isDarkMode),
          const SizedBox(height: 24),

          // Extra Section
          _buildExtraSection(isDarkMode),
          const SizedBox(height: 24),

          // Exam Section
          _buildExamSection(isDarkMode),
        ],
      ),
    );
  }

  Widget _buildStudySection(BuildContext context, bool isDarkMode) {
    // Study section items data
    final List<Map<String, dynamic>> studyItems = [
      {
        'title': 'Vocational class9',
        'icon': Icons.school,
        'color': Colors.blue,
        'students': '120 Students'
      },
      {
        'title': 'Vocational class10',
        'icon': Icons.school,
        'color': Colors.green,
        'students': '98 Students'
      },
      {
        'title': 'Vocational class11',
        'icon': Icons.school,
        'color': Colors.orange,
        'students': '85 Students'
      },
      {
        'title': 'Vocational class12',
        'icon': Icons.school,
        'color': Colors.purple,
        'students': '76 Students'
      },
      {
        'title': 'Language practice',
        'icon': Icons.language,
        'color': Colors.red,
        'students': '150 Students'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '1 Study Section',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.blue.shade200 : Colors.blue.shade800,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          color: isDarkMode ? Colors.blue.shade900 : Colors.blue.shade50,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 1.2,
              ),
              itemCount: studyItems.length,
              itemBuilder: (context, index) {
                final item = studyItems[index];
                return _buildStudyGridItem(
                  context: context,
                  title: item['title'] as String,
                  icon: item['icon'] as IconData,
                  color: item['color'] as Color,
                  students: item['students'] as String,
                  isDarkMode: isDarkMode,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStudyGridItem({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color color,
    required String students,
    required bool isDarkMode,
  }) {
    return Card(
      elevation: 3,
      color: isDarkMode ? Colors.grey.shade800 : Colors.white,
      child: InkWell(
        onTap: () {
          // Handle grid item tap
          print('$title tapped');

          // Navigation for all vocational classes
          if (title == 'Vocational class9') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VocationalClass9Screen()),
            );
          }
          else if (title == 'Vocational class10') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VocationalClass10Screen()),
            );
          }
          else if (title == 'Vocational class11') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VocationalClass11Screen()),
            );
          }
          else if (title == 'Vocational class12') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VocationalClass12Screen()),
            );
          }
          else if (title == 'Language practice') {
            // Navigate to Language Practice screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SubjectDetailsScreen(subjectName: 'Language Practice'),
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                students,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExtraSection(bool isDarkMode) {
    // Extra section items data
    final List<Map<String, dynamic>> extraItems = [
      {
        'title': 'IELTS',
        'icon': Icons.assignment,
        'color': Colors.green,
        'description': 'International English Language Testing System'
      },
      {
        'title': 'Language practice',
        'icon': Icons.language,
        'color': Colors.blue,
        'description': 'Improve your language skills'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '2 Extra Section',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.green.shade200 : Colors.green.shade800,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          color: isDarkMode ? Colors.green.shade900 : Colors.green.shade50,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 1.5,
              ),
              itemCount: extraItems.length,
              itemBuilder: (context, index) {
                final item = extraItems[index];
                return _buildExtraGridItem(
                  title: item['title'] as String,
                  icon: item['icon'] as IconData,
                  color: item['color'] as Color,
                  description: item['description'] as String,
                  isDarkMode: isDarkMode,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExtraGridItem({
    required String title,
    required IconData icon,
    required Color color,
    required String description,
    required bool isDarkMode,
  }) {
    return Card(
      elevation: 3,
      color: isDarkMode ? Colors.grey.shade800 : Colors.white,
      child: InkWell(
        onTap: () {
          // Handle extra item tap
          print('$title tapped');
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExamSection(bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '3 Exam Section',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.orange.shade200 : Colors.orange.shade800,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          color: isDarkMode ? Colors.orange.shade900 : Colors.orange.shade50,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.quiz,
                    size: 50,
                    color: isDarkMode ? Colors.orange.shade200 : Colors.orange.shade700,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'SAE MCQ Exam',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Test your knowledge with multiple choice questions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDarkMode ? Colors.grey.shade400 : Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle exam start
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode ? Colors.orange.shade700 : Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: const Text('Start Exam'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Placeholder screens for other navigation items
class MyNoteScreen extends StatelessWidget {
  const MyNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'My Notes Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class MyCourseScreen extends StatelessWidget {
  const MyCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'My Course Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Profile Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}