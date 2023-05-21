import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class ContactList extends StatelessWidget {
  final List<User> users;
  const ContactList({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  With this Container I'm simply restraining the contacts
      //  list width.
      constraints: BoxConstraints(
        maxWidth: 280,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(Icons.search, color: Colors.grey[600]),
              const SizedBox(width: 8.0),
              Icon(Icons.more_horiz, color: Colors.grey[600]),
            ],
          ),
          Expanded(
            //  Without above "Expanded" widget wrapping around
            //  the ListView builder has un-bounded height causing
            //  error and with above widget ListView takes all the
            //  available height due to which I have my all list of
            //  contacts vertically displayed.
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final User user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: UserCard(user: user),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
