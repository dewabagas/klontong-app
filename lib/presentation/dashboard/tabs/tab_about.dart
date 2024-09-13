import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:klontong_app/presentation/core/constants/styles.dart';
import 'package:klontong_app/presentation/core/utils/extension/double_extension.dart';
import 'package:klontong_app/presentation/dashboard/widgets/about_item.dart';
import 'package:klontong_app/presentation/shared/pages/page_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class TabAbout extends StatefulWidget {
  const TabAbout({super.key});

  @override
  State<TabAbout> createState() => _TabAboutState();
}

class _TabAboutState extends State<TabAbout> {
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBarTitle: 'Tentang Aplikasi',
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            24.0.height,
            Text('Profil Pembuat', style: TextStyles.bold12),
            16.0.height,
            const AboutItem(
                title: 'Nama',
                icon: Icons.person_pin,
                subtitle: 'Bagas Dewanggono'),
            InkWell(
              onTap: () => _launchUrl(
                  'https://www.linkedin.com/in/bagas-dewanggono-b43372142/'),
              child: const AboutItem(
                title: 'LinkedIn',
                icon: Icons.social_distance,
                subtitle: '/bagas-dewanggono-b43372142',
              ),
            ),
            InkWell(
              onTap: () => _launchUrl('https://github.com/dewabagas'),
              child: const AboutItem(
                title: 'GitHub',
                icon: Icons.code,
                subtitle: '/dewabagas',
              ),
            ),
            InkWell(
              onTap: () => _launchUrl('https://wa.me/6285158046944'),
              child: const AboutItem(
                title: 'WhatsApp',
                icon: Icons.phone_iphone_rounded,
                subtitle: '62 851-5804-6944',
              ),
            ),
            16.0.height,
            Text('Tech Stack', style: TextStyles.bold12),
            16.0.height,
            const AboutItem(
                title: 'State Management',
                icon: Icons.computer,
                subtitle: 'BLoC & Cubit'),
            const AboutItem(
                title: 'Auth', icon: Icons.login, subtitle: 'Firebase Auth'),
            const AboutItem(
                title: 'CRUD', icon: Icons.add_box, subtitle: 'Beeceptor'),
            const AboutItem(
                title: 'Error Reporting',
                icon: Icons.error_outline,
                subtitle: 'Sentry, Crashlytics'),
          ],
        ),
      ),
    );
  }
}
