// main.dart (ADMIN APP VERSION)
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
// Import local files
import 'firebase_options.dart';
import 'auth/login_page.dart';
import 'pages/admin/admin_dashboard.dart'; 
import 'core/mqtt/mqtt_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MqttService()..connect(),
        ),
      ],
      child: MaterialApp(
        title: 'Calm Reminder Admin',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
          // Menggunakan warna oranye/merah agar terlihat beda dengan aplikasi User
          colorSchemeSeed: Colors.deepOrange, 
        ),
        
        initialRoute: '/login',
        
        routes: {
          '/login': (context) => const LoginPage(),
          '/admin_dashboard': (context) => const AdminDashboardPage(),
          // Route user telah dihapus
        },

        home: const LoginPage(),
      ),
    );
  }
}