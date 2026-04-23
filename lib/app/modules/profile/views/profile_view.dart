import '../../../export.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacing(height: PAGE_WRAPPER),
            //* Avatar
            CircleAvatar(
              radius: 45,
              backgroundColor: XColor.primary().withOpacity(0.15),
              child: Icon(
                Icons.person,
                size: 45,
                color: XColor.primary(),
              ),
            ),
            Spacing(),
            _profileItem(Icons.person, "Nama", 'Mobile Developer'),
            Spacing(),
            _profileItem(Icons.phone, "Phone", '081234567890'),
            Spacing(),
          ],
        ),
      ),
    );
  }

  Widget _profileItem(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: XColor.netral1(),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: XColor.primary()),
          Spacing(width: 12),
          Expanded(
            child: Text(title, style: h3n),
          ),
          Text(value, style: h3b)
        ],
      ),
    );
  }
}
