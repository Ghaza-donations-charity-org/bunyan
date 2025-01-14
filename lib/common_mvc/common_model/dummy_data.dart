import 'package:ghaza_donations_app/common_mvc/common_model/donation_goal.dart';

///This file contains dummy data, for testing purposes.
///should be removed once the actual data is available.

DonationGoal dummyDonationGoal = DonationGoal(
  title: 'Help us build a school',
  description:
      'We are trying to build a school in a remote area in the middle of the desert, where children have to walk for hours to reach the nearest school. We need your help to make this dream come true.',
  targetAmount: 100000,
  currentAmount: 50000,
  imageUrl: 'https://i.ytimg.com/vi/cdTEfLhI5cU/maxresdefault.jpg', unit: 'USD',
);

DonationGoal dummyDonationGoal2 = DonationGoal(
  title: 'Help us build a hospital',
  description:
      'We are trying to build a hospital in a remote area in the middle of the desert, where people have to walk for hours to reach the nearest hospital. We need your help to make this dream come true.',
  targetAmount: 100000,
  currentAmount: 50000,
  imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-m_9mpomTObnXPylNrF9XbCENdQu-4lWLpw&s', unit: 'USD',
);

List<DonationGoal> dummyDonationGoals = [dummyDonationGoal, dummyDonationGoal2];